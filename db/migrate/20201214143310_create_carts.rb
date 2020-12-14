class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :sum_price
      t.integer :all_kcal
      t.timestamps
    end
  end
end
