class AddCategoryColumnToPromotes < ActiveRecord::Migration[5.0]
  def change
    add_column :promotes, :category, :integer
  end
end
