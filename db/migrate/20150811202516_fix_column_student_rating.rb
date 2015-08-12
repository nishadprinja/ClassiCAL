class FixColumnStudentRating < ActiveRecord::Migration
  def change
  	rename_column :professors, :studentRating, :student_rating
  end
end
