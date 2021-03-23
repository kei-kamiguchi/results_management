class TimeCardsController < ApplicationController

  def index
    today = Date.today
    @year = today.year
    @month = today.month
    @time_cards = monthly_time_cards(@year, @month)
  end

  def new
    @time_card = TimeCard.today
  end

  def create
    @time_card = TimeCard.today
    @time_card.in_at = Time.now
    if @time_card.save
      working_status = @time_card.working_status
      redirect_to new_time_card_path
    else
      render json: { status: 'error' }
    end
  end

  def update
    @time_card = TimeCard.find(params[:id])
    @time_card.out_at = Time.now
    if @time_card.save
      working_status = @time_card.working_status
      redirect_to new_time_card_path
    else
      render json: { status: 'error' }
    end
  end

  private

    # 指定年月の全ての日のタイムカードの配列を取得する（タイムカードが存在しない日はnil）
    def monthly_time_cards(year, month)
      number_of_days_in_month = Date.new(year, month, 1).next_month.prev_day.day
      results = Array.new(number_of_days_in_month) # 月の日数分nilで埋めた配列を用意
      time_cards = TimeCard.monthly(year, month)
      time_cards.each do |card|
        results[card.day - 1] = card
      end
      results
    end
end
