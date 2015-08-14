class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
    	t.references :course
    	t.integer :linked_course_id
    end
  end
end