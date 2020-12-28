class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :reserve_date
      t.date :deliver_date
      t.string :deliver_address
      
      t.timestamps
    end
  end
end
