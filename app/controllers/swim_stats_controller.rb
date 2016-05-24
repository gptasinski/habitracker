class SwimStatsController < ApplicationController


  def index
    @user = User.find(session[:id])
    @swim_stats = @user.swim_stats
  end

  def show
    @user = User.find(session[:id])
    @swim_stat = SwimStat.find(params[:id])
  end

  def new
    @user = User.find(session[:id])
    @swim_stat = SwimStat.new
  end

  def edit
    @user = User.find(session[:id])
    @swim_stat = SwimStat.find_by(id: params[:id])
  end

  def create
    @user = User.find(session[:id])
    @swim_stat = SwimStat.new(swim_stat_params)
    if @swim_stat.save
      @swim_stat.set_times(@swim_stat)
      @user.swim_stats << @swim_stat
      redirect_to user_swim_stats_path(@user)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(session[:id])
    @swim_stat = SwimStat.find_by(id: params[:id])
    if @swim_stat.update(swim_stat_params)
      redirect_to user_swim_stats_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(session[:id])
    @swim_stat = SwimStat.find_by(id: params[:id])
    @swim_stat.destroy
    redirect_to user_swim_stats_path(@user)
  end

  private
    def swim_stat_params
      params.require(:swim_stat).permit(:date, :warm_50, :warm_100, :warm_200, :warm_400, :pre_50, :first_500, :second_500, :third_500, :fourth_500, :set_100, :post_50, :cool_400, :cool_200, :cool_100, :cool_50, :set_distance, :total_distance, :swim_time, :total_time)
    end
end