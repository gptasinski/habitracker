class SwimStatsController < ApplicationController
  before_action :find_user
  before_action :find_swim_stat, except: [:new, :create]

  def index
    @swim_stats = @user.swim_stats
  end

  def show
  end

  def new
    @swim_stat = SwimStat.new
  end

  def edit
  end

  def create
    @swim_stat = SwimStat.new(swim_stat_params)
    @swim_stat.set_times
    if @swim_stat.save
      @user.swim_stats << @swim_stat
      redirect_to user_swim_stats_path(@user)
    else
      render 'new'
    end
  end

  def update
    @swim_stat.set_times
    @swim_stat.save
    if @swim_stat.update(swim_stat_params)
      redirect_to user_swim_stats_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @swim_stat.destroy
    redirect_to user_swim_stats_path(@user)
  end

  private
    def swim_stat_params
      params.require(:swim_stat).permit(:date, :warm_50, :warm_100, :warm_200, :warm_400, :pre_50, :first_500, :second_500, :third_500, :fourth_500, :set_100, :post_50, :cool_400, :cool_200, :cool_100, :cool_50, :set_distance, :total_distance, :swim_time, :total_time)
    end
end