class RemoveTypeFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :type, :boolean
  end
end
