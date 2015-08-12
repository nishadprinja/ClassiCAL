class ChangePrerequisiteIdColumnName < ActiveRecord::Migration
  def change
  	rename_column :prerequisites, :prerequisite_id, :linked_course_id
  end
end
