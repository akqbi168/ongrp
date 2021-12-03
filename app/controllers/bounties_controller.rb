class BountiesController < ApplicationController

  def index
    @bounties = Bounty.all.order("id")
  end

  def new
    @bounty = Bounty.new
  end

  def edit
    @bounty = Bounty.find(params[:id])
  end

  def create
    @bounty = Bounty.new(bounty_params)
    @bounty.save
    redirect_to bounties_path
  end

  def update
    @bounty = Bounty.find(params[:id])
    @bounty.update(bounty_params)
    redirect_to bounties_path
  end

  private

  def bounty_params
    params.require(:bounty).permit(:staff_c, :staff_b, :staff_a, :lead_b, :lead_a, :director, :ratio)
  end

end
