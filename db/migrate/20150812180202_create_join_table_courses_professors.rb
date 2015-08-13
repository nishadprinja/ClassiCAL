class CreateJoinTableCoursesProfessors < ActiveRecord::Migration
  def change
  	create_join_table :courses, :professors do |t|
     	t.references :course
     	t.references :professor
     end
  end
end
