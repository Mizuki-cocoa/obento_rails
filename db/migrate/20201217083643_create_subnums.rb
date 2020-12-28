class CreateSubnums < ActiveRecord::Migration[5.2]
  def change
    create_table :subnums do |t|
      t.integer :sum_num
      t.timestamps
    end
  end
end
