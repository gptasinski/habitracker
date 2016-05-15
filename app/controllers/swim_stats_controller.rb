class SwimStatsController < ApplicationController


  def show
    @user = User.find(session[:id])
    @swim_stat = SwimStat.find_by(id: params[:id])
  end

  def index
    @user = User.find(session[:id])
    @swim_stats = @user.swim_stats
  end
end