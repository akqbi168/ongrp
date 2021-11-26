class CasesController < ApplicationController

  def show
  end

  def new
    @user = current_user
    @report_today = Report.where(user_id: @user, date: Date.current)
    @case = Case.new
    # @report = Report.where(user_id: @user, date: Date.current)
  end

  def edit
  end

  def create
    @case = Case.new(case_params)

    @user = current_user
    @report_today = Report.where(user_id: @user, date: Date.current)
    if @report_today.exists?
      # @report = Report.find(18)
      @report = Report.where(user_id: @user, date: Date.current)
      # binding.pry
      # @case.report_id = Report.where(user_id: @user, date: Date.current).id
      @case.report_id = 3
      # binding.pry
    else
      # binding.pry
      @report = Report.new
      @report.date = Date.current
      @report.store_id = 1
      @report.user_id = @user.id
      @report.is_submitted = false
      @report.save
      @case.report_id = @report.id
    end

    # @case.report_id = @report.id

    # binding.pry
    if @case.save
      # binding.pry
      redirect_to root_path, flash: { notice: '速報を報告しました。' }
    else
      # binding.pry
      render 'new'
    end
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