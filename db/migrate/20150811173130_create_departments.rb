class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
    	t.string :department_name
    end
  end
end
