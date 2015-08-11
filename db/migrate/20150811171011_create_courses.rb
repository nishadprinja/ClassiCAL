class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t| #rails knows to name this table items because you told it to
    	t.belongs_to :description		#t is for type, symbol is description. so creating the type and the name of your column
    	t.string :course							
    	t.integer :department_id
    	t.string :course_number
    	t.integer :professor_id
    	t.string :location
    	t.datetime :time_start
    	t.datetime :time_end
    	t.text :summary
    	t.integer :paired_class_id
    	t.boolean :online
    end
  end
end
