class PedStatsController < ApplicationController
  before_action :find_user

  def index
    @ped_stats = @user.ped_stats
  end

  def show
    @ped_stat = PedStat.find(params[:id])
  end

  def new
    @ped_stat = PedStat.new
  end

  def create
    @ped_stat = PedStat.new(ped_stat_params)
    @ped_stat.set_user(@user)
    if @ped_stat.save
      flash[:message] = "The new stat was created successfully."
      redirect_to user_ped_stats_path
    else
      flash[:message] = "An error occured while trying to create the stat."
      render 'new'
    end
  end

  def edit
    @ped_stat = PedStat.find(params[:id])
  end

  def update
    @ped_stat = PedStat.find(params[:id])
    if @ped_stat.update(ped_stat_params)
      flash[:message] = "The stat was updated successfully."
      redirect_to user_ped_stats_path
    else
      flash[:message] = "An error ocured while trying to update the stat."
      render 'edit'
    end
  end

  def destroy
    @ped_stat = PedStat.find(params[:id])
    @ped_stat.destroy
    flash[:message] = "The stat was deleted successfully."
    redirect_to user_ped_stats_path
  end

  private
    def ped_stat_params
      params.require(:ped_stat).permit(:date, :time, :steps, :calories)
    end

end