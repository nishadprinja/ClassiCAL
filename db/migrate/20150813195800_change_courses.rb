class ChangeCourses < ActiveRecord::Migration
  def change
  	remove_column :courses, :time_start
  	remove_column :courses, :time_end

  	add_column :courses, :time_start, :datetime
  	add_column :courses, :time_end, :datetime
  end
end
