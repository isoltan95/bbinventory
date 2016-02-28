class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :category
      t.decimal :price
      t.integer :quantity
      
      t.timestamps null: false
    end
  end
end
