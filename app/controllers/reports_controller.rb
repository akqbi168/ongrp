class ReportsController < ApplicationController

  def index
    @reports = Report.all.where(is_submitted: true)
  end

  def index_temp
    @reports = Report.all.where(is_submitted: false)
  end

  def show
  end

  def new
    @report = Report.new
    @case = @report.cases.build
    @user = current_user
    @stores = Store.all.order("name")
    @staffs = Staff.all.order("name")
    @report_today = Report.where(user_id: @user, date: Date.current)
  end

  def edit
    @report = Report.find(params[:id])
    @case = Case.find(params[:id])
    @user = current_user
    @stores = Store.all.order("name")
    @staffs = Staff.all.order("name")
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    # binding.pry
    if @report.save
      # binding.pry
      if @report.is_submitted == false
        redirect_to root_path, flash: { notice: '報告を一時保存しました。提出を完了するにはチェックを入れて更新してください。' }
      else
        # binding.pry
        # @cases = Case.all.where(report_id: @report.id)
        # @cases.each do |c|
        #   payment = Payment.new
        #   payment.staff_id = c.staff_id
        #   payment.date = @report.date
        #   payment.rank = c.staff_id
        #   binding.pry
        #   payment.daily_result = c.point
        #   # payment.working_hours
        #   payment.save
        #   binding.pry
        # end
        redirect_to root_path, flash: { notice: '報告を提出しました。本日も一日お疲れさまでした。' }
      end
    else
      render 'new', flash: { notice: '更新できませんでした。' }
    end
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      if @report.is_submitted == false
        redirect_to root_path, flash: { notice: '報告を一時保存しました。提出を完了するにはチェックを入れて更新してください。' }
      else
        redirect_to root_path, flash: { notice: '報告を提出しました。本日も一日お疲れさまでした。' }
      end
    else
      render 'edit', flash: { notice: '更新できませんでした。' }
    end
  end

  private

  def report_params
    params.require(:report).permit(:date, :target, :store_id, :user_id, :is_submitted,
      cases_attributes: [:id, :date, :report_id, :staff_id, :point, :timeframe, :_destroy]
    )
  end

end
