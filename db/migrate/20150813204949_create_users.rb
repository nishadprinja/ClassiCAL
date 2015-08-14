class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
        t.string :last_name
    	t.string :username
    	t.integer :graduation_year
    	t.integer :major_id
    	t.integer :minor_id
    	t.string :password_digest
    end
  end
end
