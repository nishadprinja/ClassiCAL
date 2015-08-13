class UserCourse < ActiveRecord::Base
	has_many :courses 
	belongs_to :user, dependent: :destroy 

	#check if student already took course
	#check if student too prerequisites
	#check for time conflicts with other courses
	#student should automatically be able to add paired course
		#if paired course conflicts, can't add alert.

	def can_user_take_course #this method will call 4 methods
		def course_completed
			#loop through the users courses 
				#if a course in that array = the course they want to take, return false, 'you've already taken this course'
		end 

		def completed_prereqs
			#grab paired_course_id(s) from courses table
			#loop through the users courses 
				#if there's a match, return true, nil
		end

		def time_conflicts
			#loop through courses already added to calendar, check time_start & time_end
				#make it a 24-hour clock
				#if desired course is between time_start & time_end OR = time_start, return false, 'you have a time conflict'
		end

		def add_paired_course
			#grab paired_course_id from courses table
			#if first three conditions are met, add the paired course(s) to the div
		end
		
		bool_one, note_one = course_completed   #1. check if student already took course
		

		bool_two, note_two = completed_prereqs   #2. check if student took prerequisites
		bool_three, note_three = time_conflicts #3. check for time conflicts with other courses
		bool_four, note_four = add_paired_course  #4. student should automatically be able to add paired course
							#if paired coiurse conflicts, can't add alert.
		#so if all the bool's are true, return true and render the div in the calendar
		
	end


end

	#BACKBONE
#when user drags course from catalog to schedule
	#have event listener in js 
	#make an ajax call to the route to save a new user_course record
		#render all the users courses in JSON 
		#replace the users schedule with the new information





#A 'belongs_to' association sets up a one-to-one connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.
