class SessionsController < ApplicationController

	def new
		#do I need this?
	end

	def create
		user = User.find_by(username: params[:username])
  		if user && user.authenticate(params[:password])
    		session[:current_user_id] = user.id
    		redirect_to artists_path
  		else
    		redirect_to splash_path
  		end
	end


	def show
		#do I need this?
	end


	def destroy
		session[:current_user_id] = nil
  		redirect_to root_path
	end



end