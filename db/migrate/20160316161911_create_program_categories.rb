class CreateProgramCategories < ActiveRecord::Migration
  def change
    create_table :program_categories do |t|

      t.timestamps null: false
    end
  end
end
