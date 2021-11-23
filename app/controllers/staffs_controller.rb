class StaffsController < ApplicationController

  def index
    @staffs = Staff.all
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to staffs_path, flash: { notice: 'スタッフ情報が追加されました。' }
    else
      render 'new', flash: { notice: '追加できませんでした。' }
    end
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to staffs_path, flash: { notice: 'スタッフ情報を更新しました。' }
    else
      render 'edit', flash: { notice: '修正できませんでした。' }
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :rank, :memo)
  end

end
