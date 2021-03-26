class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :admin_require

  def index
    @users = User.where.not(id: current_user.id, admin: true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
    today = Date.today
    @year = today.year
    @month = today.month
    @time_cards = @user.time_cards
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path
    else
      flash[:notice] = 'この管理者は削除できません。'
      redirect_to admin_users_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def admin_require
      unless current_user.admin?
        flash[:notice] = '管理者以外アクセスできません。'
        redirect_to new_time_card_path
      end
    end

    # 指定年の全ての月のタイムカードの配列を取得する（タイムカードが存在しない月はnil）
    # def yearly_time_cards(user, year)
    #   results = Array.new(12) # 年の月数分nilで埋めた配列を用意
    #   time_cards = TimeCard.yearly(user, year)
    #   time_cards.each do |time_card|
    #     results[time_card.month - 1] = time_card
    #   end
    #   results
    # end

end
