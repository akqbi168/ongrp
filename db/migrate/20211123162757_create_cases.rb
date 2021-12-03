class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|

      t.integer :report_id, null: false
      t.integer :staff_id, null: false
      t.float :point, null: false

      t.integer :timeframe

      t.timestamps
    end
  end
end
