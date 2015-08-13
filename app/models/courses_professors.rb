class CoursesProfessors < ActiveRecord::Base
	belongs_to :course
	belongs_to :professor
end

#professors should have many courses
