class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
