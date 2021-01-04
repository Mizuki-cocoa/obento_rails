class CreateBentos < ActiveRecord::Migration[5.2]
  def change
    create_table :bentos do |t|
      t.references :box
      t.references :cart
      t.integer :sum_kcal
      t.integer :num
      t.timestamps
    end
  end
end
