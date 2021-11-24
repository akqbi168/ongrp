class CasesController < ApplicationController

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def create
    @case = Case.new(case_params)
    @case.save
    redirect_to root_path, flash: { notice: '' }
  end

  def update
    @case = Case.find(params[:id])
    @case.update(case_params)
    redirect_to root_path, flash: { notice: 'スタッフ情報を更新しました。' }
  end

  private

  def case_params
    params.require(:case).permit(:date, :report_id, :staff_id, :point, :timeframe)
  end

end
