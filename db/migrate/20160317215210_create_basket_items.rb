class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.integer :quantity
      t.integer :item_id
      t.integer :basket_id

      t.timestamps null: false
    end
  end
end
