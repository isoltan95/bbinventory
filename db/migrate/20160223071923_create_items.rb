class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :barcode
      t.string :name
      t.string :gender
      t.string :age
      t.integer :quantity
      t.string :notes
      
      t.timestamps null: false
    end
  end
end
