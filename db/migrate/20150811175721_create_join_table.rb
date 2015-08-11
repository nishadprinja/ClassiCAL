class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :courses, :materials do |t|
     	t.integer :course_id
     	t.integer :material_id
    end
  end
end
