class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
    	t.string :name
    	t.string :overall_quality
    	t.integer :average_grade
    	t.integer :helpfulness
    	t.integer :clarity
    	t.integer :easiness
    	t.string :student_rating
    end
  end
end
