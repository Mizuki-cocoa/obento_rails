class CreateOrderSubdishes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_subdishes do |t|
      t.references :order
      t.integer :sub_dish_id
      t.timestamps
    end
  end
end
