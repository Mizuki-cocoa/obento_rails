class CreateBentos < ActiveRecord::Migration[5.2]
  def change
    create_table :bentos do |t|
      t.integer :sum_kcal
      t.integer :num
      t.timestamps
    end
  end
end
