class SmokerStatsController < ApplicationController
  before_action :find_user, except: [:new, :edit]
  before_action :find_smoker_stat, only: [:edit, :update, :destroy]

  def index
    @smoker_stats = SmokerStat.where(user_id: @user.id).order(date: "ASC")
  end

  def new
    @smoker_stat = SmokerStat.new
  end

  def edit
  end

  def create
    @smoker_stat = SmokerStat.new(smoker_stat_params)
    if @smoker_stat.save
      @user.smoker_stats << @smoker_stat
      redirect_to user_smoker_stats_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @smoker_stat.update(smoker_stat_params)
      redirect_to user_smoker_stats_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @smoker_stat.destroy
    redirect_to user_smoker_stats_path(@user)
  end

  private
    def smoker_stat_params
      params.require(:smoker_stat).permit(:date, :amount)
    end
end