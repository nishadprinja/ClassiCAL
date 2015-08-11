class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
    	t.integer :course_id
    	t.integer :prerequisite_id
    end
  end
end
