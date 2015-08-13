class CoursesController < ApplicationController

	def index
		render json: Course.all 
	end

	#want to add courses to calendar
	#want to remove courses from calendar
	#want to render all of the courses on the right side of the screen 
	#want to render one course in a modal/popup on click
	
end