class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
    	t.string :name
    	t.integer :cost
    	t.text :link
    end
  end
end
