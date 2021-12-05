class PaymentsController < ApplicationController

  def index
    @q = Payment.ransack(params[:q])
    @results = @q.result.includes(:staff).order("date")

    @paymentsall = Payment.all.order("date")
    @ranks = Rank.all
    @bounties = Bounty.all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def edit
    @payments = Payment.find(params[:id])
  end

  def create
  end

  def update
  end

  def search
  end

end