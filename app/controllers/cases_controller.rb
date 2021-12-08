class CasesController < ApplicationController

  def index
    @reports = Report.all
    @cases = Case.all
  end

  def new
    user = current_user
    @report_today = Report.where(user_id: user, date: Date.current)
    @case = Case.new
  end

  def edit
  end

  def create
    @case = Case.new(case_params)

    user = current_user
    @report_today = Report.where(user_id: user, date: Date.current)
    if @report_today.exists?
      @report = Report.find_by(user_id: user, date: Date.current)
    else
      redirect_to root_path, flash: { notice: '報告開始してください。' }
    end

    @case.report_id = @report.id
    @case.confirmed_by_client = false

    if @case.save
      redirect_to root_path, flash: { notice: '速報を報告しました。' }
    else
      render 'new', flash: { notice: '報告できませんでした。' }
    end
  end

  def update
    @case = Case.find(params[:id])
    @case.update(case_params)
    redirect_to root_path, flash: { notice: '速報を更新しました。' }
  end

  def destroy
    @case = Case.find(params[:id])
    @report = Report.find(@case.report_id)
    @case.destroy
    redirect_to edit_report_path(@report), flash: { notice: '速報を削除しました。' }
  end

  private

  def case_params
    params.require(:case).permit(:date, :report_id, :staff_id, :point, :timeframe, :customer_name, :memo, :confirmed_by_client, :comment_by_client)
  end

end