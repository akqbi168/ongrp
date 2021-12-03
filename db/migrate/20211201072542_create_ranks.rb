class CreateRanks < ActiveRecord::Migration[6.1]
  def change
    create_table :ranks do |t|

      t.string :name, null: false
      t.integer :per_hour, null: false
      t.string :requirements

      t.timestamps
    end
  end
end
