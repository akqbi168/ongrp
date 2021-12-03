class PaymentsController < ApplicationController

  def index
    @payments = Payment.all.order("date")
    @ranks = Rank.all
    @bounties = Bounty.all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def create
  end

  def update
  end

end


      # t.integer :staff_id, null: false
      # t.date :date, null: false

      # t.integer :job_id
      # t.integer :pay_working_hours
      # t.integer :pay_per_hour
      # t.integer :individual_result
      # t.integer :daily_result_by_store
      # t.integer :adjuster, default: 0
      # t.integer :report_id

      # t.boolean :is_confirmed, default: false