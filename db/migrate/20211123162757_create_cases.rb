class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|

      t.integer :report_id, null: false
      t.integer :timeframe

      t.string :customer_name
      t.string :memo
      t.boolean :confirmed_by_client, default: false
      t.string :comment_by_client

      t.timestamps
    end
  end
end
