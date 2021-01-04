class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :bento, null: false
      t.references :dish, null: false
      t.timestamps
    end
  end
end
