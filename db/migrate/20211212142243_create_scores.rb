class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|

      t.integer :case_id, null: false
      t.integer :staff_id, null: false
      t.float :point, null: false

      t.timestamps
    end
  end
end
