class User < ApplicationRecord
  before_destroy :not_delete_last_admin_user

  has_many :time_cards
  has_many :work_results

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def not_delete_last_admin_user
    if self.admin == true && User.where(admin: "ture").count == 1
      throw :abort
    end
  end
end
