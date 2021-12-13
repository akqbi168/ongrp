class StaffsController < ApplicationController

  def index
    @staffs = Staff.all.order("id")
    # @reports = Report.all
  end

  def show
    @staff = Staff.find(params[:id])
    @date_indicator = Date.new(2021,12,01)
  end

  def new
    @staff = Staff.new
    @ranks = Rank.all.order("per_hour")
  end

  def edit
    @staff = Staff.find(params[:id])
    @ranks = Rank.all.order("per_hour")
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to staffs_path, flash: { notice: 'スタッフ情報が追加されました。' }
    else
      flash.now[:alert] = "氏名と役職を入力してください。"
      render 'new'
    end
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to staffs_path, flash: { notice: 'スタッフ情報を更新しました。' }
    else
      flash.now[:alert] = "氏名と役職を確認してください。"
      render 'edit'
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :rank_id, :memo)
  end

end
