class CreateAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :associations do |t|
      t.references :cart, null: false
      t.references :sub_dish, null: false
      t.integer :num
      t.timestamps
    end
  end
end
