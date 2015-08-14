class Prerequisite < ActiveRecord::Base
	belongs_to :courses 
	has_one :paired_course, class_name: 'Course', foreign_key: 'paired_course_id'
end

