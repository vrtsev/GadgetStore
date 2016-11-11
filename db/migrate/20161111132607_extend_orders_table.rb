class ExtendOrdersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :email, :string
    add_column :orders, :delivery_method, :integer
    add_column :orders, :pay_method, :integer
    add_column :orders, :order_comment, :text
  end
end
