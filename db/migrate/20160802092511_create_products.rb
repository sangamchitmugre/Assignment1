class CreateProducts < ActiveRecord::Migration[5.0]
 
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand_name
      t.string :url
      t.float :price
      t.integer :quantity
      
      t.timestamps
    end
  end
end
