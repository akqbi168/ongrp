class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def edit
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path, flash: { notice: '催事場所が新しく追加されました。' }
    else
      render 'new', flash: { notice: '追加できませんでした。' }
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to stores_path, flash: { notice: '催事場所を修正しました。' }
    else
      render 'edit', flash: { notice: '修正できませんでした。' }
    end
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end

end
