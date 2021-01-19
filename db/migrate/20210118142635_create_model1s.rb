class CreateModel1s < ActiveRecord::Migration[5.2]
  def change
    create_table :model1s do |t|
      t.references :orders, polymorphic: { default: 'Photo' }
      t.integer :bento_id
      t.timestamps
    end
  end
end
