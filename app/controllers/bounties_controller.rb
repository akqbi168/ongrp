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
    if @bounty.save
      redirect_to bounties_path, flash: { notice: 'インセンティブを追加しました。' }
    else
      flash.now[:alert] = "データを追加できませんでした。適用しない項目には 0 を入力してください。"
      render 'new'
    end
  end

  def update
    @bounty = Bounty.find(params[:id])
    if @bounty.update(bounty_params)
      redirect_to bounties_path, flash: { notice: 'インセンティブを修正しました。' }
    else
      flash.now[:alert] = "データを修正できませんでした。適用しない項目には 0 を入力してください。"
      render 'edit'
    end
  end

  private

  def bounty_params
    params.require(:bounty).permit(:staff_c, :staff_b, :staff_a, :lead_b, :lead_a, :director, :ratio)
  end

end