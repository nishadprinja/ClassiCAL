class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t| 
    	t.string :course_name							
    	t.references :department 
    	t.string :course_number 
    	t.string :professor
    	t.string :location
        t.string :day
    	t.datetime :time_start
    	t.datetime :time_end
    	t.text :summary
    	t.integer :paired_course_id
    	t.boolean :online
    end
  end
end