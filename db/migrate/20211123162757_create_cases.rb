class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|

      t.date :date
      t.integer :report_id
      t.integer :staff_id, null: false
      t.integer :point, null: false

      t.integer :timeframe, null: false

      t.timestamps
    end
  end
end
