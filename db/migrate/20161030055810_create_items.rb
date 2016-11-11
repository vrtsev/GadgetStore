class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.boolean :available
      t.integer :category

      t.timestamps
    end
  end
end
