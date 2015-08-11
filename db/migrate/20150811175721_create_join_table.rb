class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :courses, :materials do |t|
     	t.references :course
     	t.references :material
    end
  end
end
