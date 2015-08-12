class Prerequisite < ActiveRecord::Base
	belongs_to :courses 
	#has_many :linked_courses, class_name:, 'Course', foreign_key: ''
end

