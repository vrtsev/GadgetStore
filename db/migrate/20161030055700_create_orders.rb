class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :city
      t.string :phone
      t.string :fullname

      t.timestamps
    end
  end
end
