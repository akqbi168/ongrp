class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|

      t.integer :report_id, null: false
      t.integer :staff_id, null: false
      t.integer :timeframe
      t.float :point, null: false

      t.string :customer_name
      t.string :memo
      t.boolean :confirmed_by_client
      t.string :comment_by_client

      t.timestamps
    end
  end
end
