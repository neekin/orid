module SessionHelper

  def current_user
    @current_user ||= User.find_by_token(cookies[:token]) if cookies[:token]
  end

  def log_in(user)
    cookies.permanent[:token] =user.token
  end

end
