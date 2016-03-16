class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :gender
      t.integer :age
      t.integer :quantity
      t.string :notes
      
      t.timestamps null: false
    end
  end
end
