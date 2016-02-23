class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.bigint :code
      t.string :name
      t.string :category
      t.decimal :price

      t.timestamps null: false
    end
  end
end
