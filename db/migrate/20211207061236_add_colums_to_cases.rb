class AddColumsToCases < ActiveRecord::Migration[6.1]
  def change
    add_column :cases, :customer_name, :string
    add_column :cases, :memo, :string
    add_column :cases, :confirmed_by_client, :boolean
    add_column :cases, :comment_by_client, :string
  end
end
