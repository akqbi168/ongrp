class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|

      t.integer :staff_id, null: false
      t.date :date, null: false
      t.integer :rank_id, null: false
      t.integer :store_id

      t.time :time_start, null: false
      t.time :time_end, null: false
      t.integer :time_break

      t.timestamps
    end
  end
end
