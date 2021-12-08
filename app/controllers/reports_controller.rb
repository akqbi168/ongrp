class ReportsController < ApplicationController

  before_action :case_exists, only: [:new]

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
    @case_num = 0
    @user = current_user
    @stores = Store.all.order("name")
    @staffs = Staff.all.order("name")
  end

  def edit
    @@path = Rails.application.routes.recognize_path(request.referer)
    @case_num = 0
    if @@path[:controller] == "homes" && @@path[:action] == "top"
      @report = Report.find_by(user_id: @user, date: Date.current)
    else
      @report = Report.find(params[:id])
    end
    @case = Case.find(params[:id])
    @user = current_user
    @stores = Store.all.order("name")
    @staffs = Staff.all.order("name")
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      if @report.is_submitted == false
        redirect_to root_path, flash: { notice: '報告を一時保存しました。提出を完了するにはチェックを入れて更新してください。' }
      else
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
        job = Job.where(date: @report.date, store_id: @report.store_id)
        job.each do |j|
          if Payment.find_by(job_id: job.id)
            @payment = Payment.find_by(job_id: j.id)
          else
            @payment = Payment.new
            @payment.date = @report.date
          end
        end

        @payment.report_id = @report.id
        # @payment.indivisual_point
        # @payment.bonus_base
        # @payment.store_point
        # @payment.bonus_ratio



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
        # end

        redirect_to root_path, flash: { notice: '報告を提出しました。本日も一日お疲れさまでした。' }
      end
    else
      render 'edit', flash: { notice: '更新できませんでした。' }
    end
  end

  private

  def case_exists
    report_today = Report.where(user_id: current_user, date: Date.current)
    unless Case.where(report_id: report_today).exists?
      redirect_to root_path
    end
  end

  # def report_params
  #   params.require(:report).permit(:date, :target, :store_id, :user_id, :is_submitted, :comment, :action_approached, :action_discussed, :done_purchased, :done_downloaded_only, :done_discussed_only, :done_promotion, cases_attributes: [:id, :date, :report_id, :staff_id, :point, :timeframe, :_destroy])
  # end

  def report_params
    params.require(:report).permit(
      :date,
      :store_id,
      :user_id,
      :target,
      :memo,
      :is_submitted,
      :action_approached,
      :action_discussed,
      :action_purchased,
      :action_downloaded_only,
      :action_discussed_only,
      :action_promotion_done,
      :purchased_for_value,
      :purchased_for_wanted,
      :purchased_for_trial,
      :purchased_for_others,
      :purchased_for_others_memo,
      :downloaded_only_for_no_time,
      :downloaded_only_for_no_cards,
      :downloaded_only_for_app_error,
      :downloaded_only_for_others,
      :downloaded_only_for_others_memo,
      :discussed_only_for_no_time,
      :discussed_only_for_no_downloadable,
      :discussed_only_for_denying_cards,
      :discussed_only_for_no_demand,
      :discussed_only_for_app_error,
      :discussed_only_for_denying_app,
      :discussed_only_for_others,
      :discussed_only_for_others_memo,
      :promotion_done_for_value1,
      :promotion_done_for_value2,
      :promotion_done_for_value3,
      :promotion_done_for_value4,
      :promotion_done_for_others,
      :promotion_done_for_others_memo,
      cases_attributes: [:id, :report_id, :staff_id, :point, :timeframe, :customer_name, :memo, :confirmed_by_client, :comment_by_client, :_destroy]
    )
  end

end
