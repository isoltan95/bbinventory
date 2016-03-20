class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.date :checkout_date

      t.timestamps null: false
    end
  end
end
