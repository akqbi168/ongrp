class RanksController < ApplicationController

  def index
    @ranks = Rank.all.order("per_hour")
  end

  def new
    @rank = Rank.new
  end

  def edit
    @rank = Rank.find(params[:id])
  end

  def create
    @rank = Rank.new(rank_params)
    if @rank.save
      redirect_to ranks_path, flash: { notice: '役職を追加しました。' }
    else
      flash.now[:alert] = "役職を追加できませんでした。役職名と時給は必ず入力してください。"
      render 'new'
    end
  end

  def update
    @rank = Rank.find(params[:id])
    if @rank.update(rank_params)
      redirect_to ranks_path, flash: { notice: '役職を変更しました。' }
    else
      flash.now[:alert] = "役職を変更できませんでした。役職名と時給は必ず入力してください。"
      render 'edit'
    end
  end

  private

  def rank_params
    params.require(:rank).permit(:name, :per_hour, :requirements)
  end

end
