class Public::SessionsController < ApplicationController

	skip_before_action :authenticate_user

  def new
    if cookies[:remember_login]
      user = User.find_by_remember_me_token(cookies[:remember_login])
      if !user.nil?
        session[:user_id] = user.id
        cookies[:logged_in] = 'true'
        redirect_to admin_root_path, notice: "Logged in!"
      end
    end
  end

	def create  
		user, error = User.find_by_login(params)
    if error.blank?
    	session[:user_id] = user.id
      if params[:remember_me] == '1'
        cookies[:remember_login] = { value: params[:remember_me_token], expires: 365.days.from_now }
        user.validate_password = false
        user.update(remember_me_token: params[:remember_me_token])
      end
      if params[:album_id]
        redirect_to album_path(params[:album_id])
      else  
        redirect_to admin_root_path, notice: "Logged in!"
      end
    else
      redirect_to new_user_session_path, alert: error
    end
	end

	def destroy
	  session[:user_id] = nil
    cookies.delete :remember_login
    cookies.delete :logged_in
	  redirect_to root_path, :notice => "Logged out!"
	end
end