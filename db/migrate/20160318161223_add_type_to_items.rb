class AddTypeToItems < ActiveRecord::Migration
  def change
    add_column :items, :type, :integer
  end
end
