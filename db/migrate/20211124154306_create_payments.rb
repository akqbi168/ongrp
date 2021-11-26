class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|

      t.integer :staff_id, null: false
      t.date :date, null: false
      t.integer :rank, null: false
      t.integer :daily_result, default: 0, null: false
      t.integer :working_hours

      t.timestamps
    end
  end
end
