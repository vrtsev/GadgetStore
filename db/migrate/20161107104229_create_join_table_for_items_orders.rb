class CreateJoinTableForItemsOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :items_orders, id:false do |t|
      t.integer :item_id
      t.integer :order_id
    end
  end
end
