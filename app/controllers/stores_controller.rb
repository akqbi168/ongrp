class StoresController < ApplicationController

  before_action :no_director_and_no_client
  before_action :hq_admin_level_only, only: [:edit, :update]
  before_action :admin_only, only: [:destroy]

  def index
    @stores = Store.all.all.order("id")
    @reports = Report.all.order("date")
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
      flash.now[:alert] = "催事場所の名称を正しく入力してください。"
      render 'new'
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to stores_path, flash: { notice: '催事場所を修正しました。' }
    else
      flash.now[:alert] = "催事場所の名称を正しく入力してください。"
      render 'edit'
    end
  end

  def destroy
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end

end
