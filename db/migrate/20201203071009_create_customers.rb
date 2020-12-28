class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :user_name, null: false
      t.string :address
      t.string :tel_num

      t.timestamps
    end
  end
end
