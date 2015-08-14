#delete everything about the user
class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]

	def new 				#renders the signup form
    	@user = User.new
  	end


	def create				#receives the form and creates a user with the form's parameters
		@user = User.new(user_params)
		if @user.save  
			session[:current_user_id] = @user.id
			redirect_to '/', notice: 'Account created successfully' #root path is the login page
		else
			flash[:error] = 'Username or password is incorrect'
			redirect_to '/signup' # 'users#new' path
		end
	end

 #  	def show
 #    	@user = User.find(params[:id])
 #  	end

 #  	def destroy
	#     @user = User.find(params[:id])
	#     session[:current_user_id] = nil
	#     @user.destroy
	#     redirect_to root_path
	# end

  private

  def user_params
    params.require(:user).permit(:student_name, :username, :graduation_year, :password, :password_confirmation) #do we need the foreign keys here?
  end

#TO DO:
#if student is junior or senior, they must enter a major_id




end