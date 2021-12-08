class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.date :date, null: false
      t.integer :store_id, null: false
      t.integer :user_id, null: false
      t.integer :target
      t.string :memo

      t.integer :action_approached
      t.integer :action_discussed

      t.integer :action_purchased
      t.integer :action_downloaded_only
      t.integer :action_discussed_only
      t.integer :action_promotion_done

        t.integer :purchased_for_value
        t.integer :purchased_for_wanted
        t.integer :purchased_for_trial
        t.integer :purchased_for_others
        t.string :purchased_for_others_memo

        t.integer :downloaded_only_for_no_time
        t.integer :downloaded_only_for_no_cards
        t.integer :downloaded_only_for_app_error
        t.integer :downloaded_only_for_others
        t.string :downloaded_only_for_others_memo

        t.integer :discussed_only_for_no_time
        t.integer :discussed_only_for_no_downloadable
        t.integer :discussed_only_for_denying_cards
        t.integer :discussed_only_for_no_demand
        t.integer :discussed_only_for_app_error
        t.integer :discussed_only_for_denying_app
        t.integer :discussed_only_for_others
        t.string :discussed_only_for_others_memo

        t.integer :promotion_done_no_launching_later
        t.integer :promotion_done_nothing_on_demand
        t.integer :promotion_done_operating_impossible
        t.integer :promotion_done_app_malfunctioning
        t.integer :promotion_done_for_others
        t.string :promotion_done_for_others_memo

        t.integer :outside_delivery_area
        t.integer :number_of_samples
        t.string :details_of_app_malfunction

      t.boolean :is_submitted, null: false

      t.timestamps
    end
  end
end
