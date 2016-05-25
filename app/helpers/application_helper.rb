module ApplicationHelper

  def current_user
    @current ||= User.find(session[:id]) if authenticated?
  end

  def authenticated?
    session[:id] != nil
  end

  def find_user
    @user = current_user
  end

  def find_smoker_stat
    @smoker_stat = SmokerStat.find(params[:id])
  end

  def find_swim_stat
    @swim_stat = SwimStat.find_by(id: params[:id])
  end

end
