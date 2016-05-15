module ApplicationHelper

  def current_user
    @current ||= User.find(session[:id]) if authenticated?
  end

  def authenticated?
    session[:id] != nil
  end

end
