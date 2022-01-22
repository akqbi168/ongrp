class ReportsController < ApplicationController

  before_action :no_client, only: [:index, :index_temp, :show, :new, :edit, :create, :update]
  before_action :admin_only, only: [:destroy]

  def index
    @reports = Report.where(user_id: current_user.id).order("is_submitted").order("date DESC")
  end

  def index_temp
    @reports = Report.where(user_id: current_user.id, is_submitted: false).order("updated_at")
  end

  def show
    @report = Report.find(params[:id])
    @users = User.all
    @stores = Store.all
    @cases = Case.where(report_id: @report.id).order("timeframe")
    @scores = Score.all
  end

  def new
    @user = current_user
    @stores = Store.order("id")
    @report = Report.new
    @case = @report.cases.build
    @score = @case.scores.build
  end

  def edit
    @@path = Rails.application.routes.recognize_path(request.referer)
    @user = current_user
    @case_num = 0
    if @@path[:controller] == "homes" && @@path[:action] == "top"
      @report = Report.find_by(user_id: @user, date: Date.current)
    else
      @report = Report.find(params[:id])
    end

    @case = Case.find_by(report_id: @report.id)
    if @case.present?
      @score = Score.find_by(case_id: @case.id)
    end
    @stores = Store.order("id")
    @staffs = Staff.order("id")
  end

  def create
    @user = current_user
    @stores = Store.order("id")
    @report = Report.new(report_params)
    @report.user_id = @user.id
    @report.is_submitted = false
    if @report.save
      redirect_to root_path, flash: { notice: '報告を開始しました。' }
    else
      flash.now[:alert] = "実施場所を選択してください。"
      render 'new'
    end
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      if @report.cases.count != @report.scores.sum(:point)
        flash.now[:alert] = "スコアの合計を確認してください。"
        render 'edit'
      else
        if @report.is_submitted == false
          redirect_to root_path, flash: { notice: '報告を一時保存しました。提出を完了するにはチェックを入れて更新してください。' }
        else
          job = Job.where(date: @report.date, store_id: @report.store_id)
          job.each do |j|
            if Payment.find_by(job_id: j.id).present?
              @payment = Payment.find_by(job_id: j.id)
            else
              @payment = Payment.new
              @payment.date = @report.date
              @payment.staff_id = job.staff_id
              @payment.job_id = job.id
            end

            @payment.report_id = @report.id
            if @payment.staff_id.present?
              @payment.indivisual_point = @report.scores.where(staff_id: j.staff_id).sum(:point)
            else
              @payment.indivisual_point = 0
            end

            # rank_array = ["staff_c", "staff_b", "staff_a", "lead_b", "lead_a", "director"]
            # i = 1
            # while i <= 6 do
            #   @payment.bonus_base = Bounty.find(@payment.indivisual_point.to_i).rank_array[i-1]
            #   i += 1
            # end
            if j.rank_id.present? && @payment.indivisual_point != 0
              bounty = Bounty.find(@payment.indivisual_point.to_i)
              if j.rank_id == 1
                @payment.bonus_base = bounty.staff_c
              elsif j.rank_id == 2
                @payment.bonus_base = bounty.staff_b
              elsif j.rank_id == 3
                @payment.bonus_base = bounty.staff_a
              elsif j.rank_id == 4
                @payment.bonus_base = bounty.lead_b
              elsif j.rank_id == 5
                @payment.bonus_base = bounty.lead_a
              elsif j.rank_id == 6
                @payment.bonus_base = bounty.director
              end
            else
              @payment.bonus_base = 0
            end

            unless @report.scores.sum(:point) == 0 || @report.scores.sum(:point) == nil
              @payment.store_point = @report.scores.sum(:point)
            end

            unless @payment.store_point == 0 || @payment.store_point == nil
              @payment.bonus_ratio = Bounty.find(@payment.store_point.round).ratio
            end

            @payment.report_id = @report.id
            @payment.save
          end

          # @payment.report_id = @report.id
          redirect_to root_path, flash: { notice: '報告を提出しました。本日も一日お疲れさまでした。' }
        end
      end
    else
      flash.now[:alert] = "未入力の項目や数字の半角入力などを確認してください。"
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if @report.destroy
      redirect_to about_path, flash: { notice: '報告を削除しました。' }
    else
      redirect_to about_path, flash: { notice: '報告を削除できませんでした。' }
    end
  end

  private

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
      :promotion_done_no_launching_later,
      :promotion_done_nothing_on_demand,
      :promotion_done_operating_impossible,
      :promotion_done_app_malfunctioning,
      :promotion_done_for_others,
      :promotion_done_for_others_memo,
      :outside_delivery_area,
      :number_of_samples,
      :details_of_app_malfunction,
      cases_attributes: [
        :id,
        :report_id,
        :timeframe,
        :customer_name,
        :memo,
        :confirmed_by_client,
        :comment_by_client,
        :_destroy,
        scores_attributes: [
          :id,
          :staff_id,
          :point,
          :_destroy
        ]
      ]
    )
  end

end
