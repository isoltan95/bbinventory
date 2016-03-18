class RemoveIntegerTypeFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :type, :integer
  end
end
