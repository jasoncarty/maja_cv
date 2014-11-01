class Admin::SessionsController < ApplicationController

	skip_before_action :authenticate_user

	def new
	end



	def destroy
	  session[:user_id] = nil
    cookies.delete :logged_in
	  redirect_to public_root, :notice => "Logged out!"
	end
end