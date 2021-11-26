class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|

      t.integer :staff_id
      t.date :date, null: false
      t.time :time_start
      t.time :time_end
      t.integer :time_break
      t.integer :store_id
      t.integer :rank

      t.timestamps
    end
  end
end
