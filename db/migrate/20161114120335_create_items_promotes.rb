class CreateItemsPromotes < ActiveRecord::Migration[5.0]
  def change
    create_table :items_promotes, id:false do |t|
      t.belongs_to :item
      t.belongs_to :promote
    end
  end
end
