class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
    	t.references :course
    	t.references :user
    end
  end
end
