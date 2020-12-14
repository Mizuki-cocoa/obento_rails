class CreateSubDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_dishes do |t|
      t.string :sub_dish_name
      t.integer :sub_dish_price
      t.boolean :recommend, null: false, default: false
      t.string :introduction
      t.integer :sub_kcal
      t.integer :stock

      t.timestamps
    end
  end
end
