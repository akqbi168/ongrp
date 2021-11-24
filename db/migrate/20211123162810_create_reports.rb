class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.date :date
      t.integer :target
      t.integer :store_id, null: false
      t.integer :user_id, null: false

      t.boolean :is_submitted, null: false

      t.timestamps
    end
  end
end
