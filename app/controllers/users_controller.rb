#delete everything about the user
class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]
	def new
    	@user = User.new
  	end

	def create
		@user = User.new(user_params)
		if @user.save  
			session[:current_user_id] = @user.id
			redirect_to user_path
		end
		redirect_to new_user_path
	end

  	def show
    	@user = User.find(params[:id])
  	end

  	def destroy
	    @user = User.find(params[:id])
	    session[:current_user_id] = nil
	    @user.destroy
	    redirect_to root_path
	end

  private

  def user_params
    params.require(:user).permit(:student_name, :username, :graduation_year, :password, :password_confirmation) #do we need the foreign keys here?
  end







end