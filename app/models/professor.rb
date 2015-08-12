class Professor < ActiveRecord::Base
	belongs_to :courses_professors #created new join table
end

