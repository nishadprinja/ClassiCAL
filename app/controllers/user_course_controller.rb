class UserCourseController < ApplicationController

	#this shows everyone's calendar
	
	
	def index	
		render json: User_Course.where(:user_id => current_user.id)
	end

	#when you drag course from catalog into schedule, it's create
	#need logic. ex. prereq's, if there's a conflicting course
	# def create 
	# 	@calendar = User_Course.create(calendar_params)
	# 	render json: 
	# end

	# #probably don't need
	# # def update
	# # 	@calendar = Calendar.find(params[:id])
	# # 	@calendar.update(calendar_params)
	# # 	render json: @calendar
	# # end

	# #if click x and delete/remove course from schedule
	# def destroy 
	# 	@calendar = Calendar.find(params[:id])
	# 	@calendar.destroy
	# 	render json: @calendar
	# end

	private

	def calendar_params
		params.require(:calendar).permit(:course_id, :user_id) #correct?
	end

end


#want to render users calendar
#want to destroy users calendar and start over but still render an empty calendar
#want to update calendar with more/fewer courses
#want to make a new calendar
