class ChangeTimeAddTimeEnd < ActiveRecord::Migration
  def change
  		change_column :courses, :time_start, :string
  		change_column :courses, :time_end, :string
  end
end
