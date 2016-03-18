class AddDonatedToItems < ActiveRecord::Migration
  def change
    add_column :items, :donated, :boolean
  end
end
