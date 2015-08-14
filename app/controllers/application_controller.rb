class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # def index
  # 	render layout: 'application', text: ''
  # end

  def authorize
    redirect_to '/login' unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end
  helper_method :current_user #the helper method lets us use @current_user in our view files

end


# a ||= b acts like a || a = b 
  #so basically a is only set if a is logically false (if it's nil or false). if the left hand side of the || comparison is true, there's no need to check the right hand side.

