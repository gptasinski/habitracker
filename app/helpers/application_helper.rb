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

  def current_year
    Time.now.year.to_s[2..3]
  end

  def last_year
    (current_year.to_i - 1).to_s
  end




end
