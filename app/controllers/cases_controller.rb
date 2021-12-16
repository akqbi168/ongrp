class CasesController < ApplicationController

  before_action :no_director, only: [:index]
  before_action :manager_level_only, only: [:edit, :update]
  before_action :admin_only, only: [:destroy]

  before_action :cases_exist, only: [:new]

  WEBHOOK_URL = Rails.application.credentials[:WEBHOOK_URL]

  def index
    @cases = Case.all
    @reports = Report.all
  end

  def new
    @user = current_user
    @case = Case.new
    @score = @case.scores.build
  end

  def edit
    @case = Case.find(params[:id])
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

      # Slack通知処理を呼び出し
      # notifier
    else
      flash.now[:alert] = "未入力の項目を確認してください。"
      render 'new'
    end
  end

  def update
    @case = Case.find(params[:id])
    if @case.update(case_params)
      redirect_to cases_path, flash: { notice: '更新しました。' }
    else
      flash.now[:alert] = "更新できませんでした。"
      render 'edit'
    end
  end

  def cases_exist
    @report_today = Report.where(user_id: current_user, date: Date.current)
    if @report_today.nil?
      redirect_to root_path, flash: { alert: '速報を追加するにはまず日報の報告を開始してください。' }
    end
  end

  private

  # def notifier
  #   message = <<~"EOS"
  #     #{Store.find(Report.find(@case.report_id).store_id).name} #{@report.cases.count} 件目獲得しました！

  #     【氏名】#{@case.customer_name}　様
  #     【備考】#{@case.memo}

  #     よろしくお願い致します。
  #   EOS

  #   Slack::Notifier.new(WEBHOOK_URL, username: '獲得速報').ping(message)
  # end

  def case_params
    params.require(:case).permit(
      :report_id,
      :timeframe,
      :customer_name,
      :memo,
      :confirmed_by_client,
      :comment_by_client,
      scores_attributes: [
        :id,
        :staff_id,
        :point,
        :_destroy
      ]
    )
  end

end