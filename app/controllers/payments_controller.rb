class PaymentsController < ApplicationController

  def index
    @q = Payment.ransack(params[:q])
    @results = @q.result.includes(:staff).order("date")
    # @results_unique = @q.result(distinct: true).includes(:staff).order("date")

    # @payments = @q.result.order("date")
    # @payments = @q.result.includes(:department, :subjects)
    @paymentsall = Payment.all.order("date")
    @ranks = Rank.all
    @bounties = Bounty.all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def create
  end

  def update
  end

  def search
  end

  private

  # def search_params
    # params.require(:q).permit(:staff_id)
  # end

end