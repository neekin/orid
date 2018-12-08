class SessionController < ApplicationController
  def login
  end

  def create_login_session
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      # if params[:rememberme]
      # cookies.permanent[:token] =user.token #持久化保存
      log_in(user)
      if params[:callback]
        redirect_to :postorid

      else
        redirect_to :root
      end
    else
      flash.notice = "用户名密码错误!"
      redirect_to :login
    end
  end

  def logout
    # current_user

        cookies.delete(:token)
        redirect_to :root

  end

  private
  def user_params
    params.require(:user).permit(:username, :password,:callback)
  end
end
