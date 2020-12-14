class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.string :box_name
      t.integer :box_price
      t.timestamps
    end
  end
end
