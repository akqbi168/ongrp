class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|

      t.string :name, null: false
      t.string :memo

      t.integer :rank, default: 0, null: false

      t.timestamps
    end
  end
end
