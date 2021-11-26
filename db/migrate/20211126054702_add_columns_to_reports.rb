class AddColumnsToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :comment, :string

    add_column :reports, :action_approached, :integer
    add_column :reports, :action_discussed, :integer
    add_column :reports, :done_purchased, :integer
    add_column :reports, :done_downloaded_only, :integer
    add_column :reports, :done_discussed_only, :integer
    add_column :reports, :done_promotion, :integer

  end
end
