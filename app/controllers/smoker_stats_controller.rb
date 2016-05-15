class SmokerStatsController < ApplicationController

  def index
    @user = User.find(session[:id])
    @smokerstats = @user.smoker_stats
  end

  def new
    @smoker_stat = SmokerStat.new
  end

  def create
    @user = User.find_by(id: session[:id])
    @smokerstat = SmokerStat.new(smoker_stat_params)
    if @smokerstat.save
      @user.smoker_stats << @smokerstat
      redirect_to user_smoker_stats_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @smoker_stat = SmokerStat.find(params[:id])
  end

  def update
    @user = User.find(session[:id])
    @smoker_stat = SmokerStat.find(params[:id])
    if @smoker_stat.update(smoker_stat_params)
      redirect_to user_smoker_stats_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(session[:id])
    @smoker_stat = SmokerStat.find(params[:id])
    @smoker_stat.destroy
    redirect_to user_smoker_stats_path(@user)
  end

  private
    def smoker_stat_params
      params.require(:smoker_stat).permit(:date, :amount)
    end
end