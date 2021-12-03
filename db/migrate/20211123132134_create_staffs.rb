class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|

      t.string :name, null: false
      t.string :memo

      t.integer :rank_id, null: false

      t.timestamps
    end
  end
end
