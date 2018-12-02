class SessionController < ApplicationController
  def login
  end

  def create_login_session
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      # if params[:rememberme]
      cookies.permanent[:token] =user.token #持久化保存
      # else
      #   cookies[:token] = user.auth_token #临时性保存 类似 session
      # end
      redirect_to :root
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
    params.require(:user).permit(:username, :password)
  end
end
