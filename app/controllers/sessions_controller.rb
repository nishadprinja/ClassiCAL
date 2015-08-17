class SessionsController < ApplicationController

	def create
		#look in the 'username' column of the 'users' table
		user = User.find_by(username: params[:username])
		#if the user exists AND the password entered is correct
  		if user && user.authenticate(params[:password])
    		session[:current_user_id] = user.id #Save the user id inside the browser cookie. How to keep them logged in when they are using the site/program
    		redirect_to '/'
  		else
    		redirect_to '/login' #also enter message that their login info was incorrect
  		end
	end


	def destroy
		session[:current_user_id] = nil
  		redirect_to '/login'
	end

end