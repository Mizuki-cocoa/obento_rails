class CreateOrderBentos < ActiveRecord::Migration[5.2]
  def change
    create_table :order_bentos do |t|
      t.references :order
      t.integer :bento_id
      t.timestamps
    end
  end
end
