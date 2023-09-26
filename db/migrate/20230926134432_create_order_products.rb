class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :orders_id, null: false
      t.integer :items_id, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      

      t.timestamps
    end
  end
end
