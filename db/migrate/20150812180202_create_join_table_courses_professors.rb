class CreateJoinTableCoursesProfessors < ActiveRecord::Migration
  def change
  	create_join_table :courses, :professors do |t|
     	t.references :courses
     	t.references :professors
     end
  end
end
