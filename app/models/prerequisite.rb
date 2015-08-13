class Prerequisite < ActiveRecord::Base
	belongs_to :courses 
	#has_many :linked_courses, class_name:, 'Course', foreign_key: ''
end

has_one :paired_course, class_name: 'Course', foreign_key: 'paired_course_id'