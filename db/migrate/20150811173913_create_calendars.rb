class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
    	t.integer :course_id
    	t.integer :department_id
    	t.integer :user_id
    end
  end
end
