class PaymentsController < ApplicationController

  before_action :hq_admin_level_only
  before_action :manager_level_only, only: [:edit, :update]
  before_action :admin_only, only: [:new, :create, :destroy]

  def index
    @q = Payment.ransack(params[:q])
    @results = @q.result.includes(:staff).order("date")

    @paymentsall = Payment.all.order("date")
    @ranks = Rank.all
    @bounties = Bounty.all
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

  def destroy
  end

end