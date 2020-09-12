class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインできません'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # session_paramsに移し替えるイメージ
  def session_params
   params.permit(:email, :password)
  end
end
