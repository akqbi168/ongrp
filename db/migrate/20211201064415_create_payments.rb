class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|

      t.date :date, null: false
      t.integer :staff_id, null: false
      t.integer :job_id

      t.time :time_start
      t.time :time_end
      t.integer :time_break
      t.float :working_hours
      t.integer :per_hour

      t.integer :report_id

      t.float :indivisual_point
      t.integer :bonus_base
      t.float :store_point
      t.float :bonus_ratio

      t.integer :daily_payment
      t.integer :adjuster, default: 0

      t.boolean :is_confirmed_on_wage, default: false
      t.boolean :is_confirmed_on_bonus, default: false

      t.timestamps
    end
  end
end
