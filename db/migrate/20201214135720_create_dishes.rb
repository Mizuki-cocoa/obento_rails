class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.boolean :recommend, null: false, default: false
      t.string :introduction
      t.integer :dish_kcal
      t.integer :stock

      t.timestamps
    end
  end
end
