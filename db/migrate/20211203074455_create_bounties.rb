class CreateBounties < ActiveRecord::Migration[6.1]
  def change
    create_table :bounties do |t|

      t.integer :staff_c, null: false
      t.integer :staff_b, null: false
      t.integer :staff_a, null: false
      t.integer :lead_b, null: false
      t.integer :lead_a, null: false
      t.integer :director, null: false
      t.float :ratio, null: false

      t.timestamps
    end
  end
end
