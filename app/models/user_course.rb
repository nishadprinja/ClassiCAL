class UserCourse < ActiveRecord::Base
	has_many :courses 
	belongs_to :user, dependent: :destroy 

	# def add_course(course) 
	# 	self.courses.push(course) unless self.courses.include? course
	# end

	# def remove_course(course)
	# 	self.courses.destroy(course) if self.courses.include? course
	# end 
end

#A 'belongs_to' association sets up a one-to-one connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.

	#BACKBONE
#when user drags course from catalog to schedule
	#have event listener in js 
	#make an ajax call to the route to save a new user_course record
		#render all the users courses in JSON 
		#replace the users schedule with the new information