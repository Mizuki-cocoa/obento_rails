class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer
      t.integer :all_kcal
      t.integer :sum_price
      t.datetime :reserve_date
      t.datetime :deliver_date
      t.string :deliver_address
      t.timestamps
    end
  end
end
