class TimeCard < ApplicationRecord
  has_one :work_result, dependent: :destroy
  belongs_to :user

  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :month, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :day, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :valid_date # このバリデーションは year, month, day のバリーデーションの下に定義しないと有効でない
  validates :in_at, presence: true, if: lambda { |m| !m.out_at.nil? }
  validate :out_at_is_later_than_in_at

  class << self
    # 今日のタイムカードを取得する
    def today(user)
      date = Date.today
      condition = { user: user, year: date.year, month: date.month, day: date.day }
      self.find_by(condition) || self.new(condition)
    end

    # 指定年月のタイムカードを取得する
    def monthly(user, year, month)
      self.where(user: user, year: year, month: month).order(:day).all
    end

    # 指定年のタイムカードを取得する
    def yearly(user, year)
      self.where(user: user, year: year).order(:month).all
    end
  end

  # 勤務状況を取得する
  def working_status
    case [!!in_at, !!out_at]
    when [false, false]
      "未出社"
    when [true, false]
      "勤務中"
    when [true, true]
      "退社済"
    end
  end

  # タイムカードの日付を返す
  def date
    Date.new(year, month, day)
  end

  # 勤務時間を返す（単位は秒）
  def work_hours_in_seconds
    if in_at && out_at
      out_at - in_at
    else
      0
    end
  end

  private

    # カスタムバリデーション（正しい日付か？）
    def valid_date
      return if errors[:year].any? || errors[:month].any? || errors[:day].any?

      if !Date.valid_date?(year, month, day)
        errors[:base] << '不正な日付です'
      end
    end

    # カスタムバリデーション（退社時間が出社時間より後か？）
    def out_at_is_later_than_in_at
      return if in_at.nil? || out_at.nil?

      if in_at > out_at
        errors[:base] << '退社時間は、出社時間より後の時間である必要があります'
      end
    end
end
