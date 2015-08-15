class CoursesController < ApplicationController

	def index
		@courses = Course.all
		@departments = Department.all
	end

	def department_courses
		d = Department.find(params[:id])
		render json: d.courses
	end

	#want to add courses to calendar
	#want to remove courses from calendar
	#want to render all of the courses on the right side of the screen 
	#want to render one course in a modal/popup on click
	
end