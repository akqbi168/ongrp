class CasesController < ApplicationController

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
      # notice_page_info(@case)

      # notifier.ping "<!here> ユーザーが削除されました。"
      # notice_slack(@case)
      binding.pry
      notifier
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

  def notifier
    # Slack::Notifier.new(WEBHOOK_URL, username: '通知Bot', icon_emoji: ':sunglasses:')
    # Slack::Notifier.new(WEBHOOK_URL).ping('メッセージ内容をここに記載')
    Slack::Notifier.new(WEBHOOK_URL, username: '獲得速報').ping(
      '<!here> ユーザーが追加されました。'
    )
  end

  #   # 本文を生成
  #   message = <<~"EOS"
  #     契約1件獲得しました！

  #     【催事】#{Store.find(Report.find(page.report_id).store_id).name}
  #     【氏名】#{page.customer_name}　様
  #     【備考】#{page.memo}

  #     よろしくお願い致します。
  #   EOS
  #   # Slack通知処理を呼び出し
  #   notice_slack(message)
  # end


  # slack通知用メソッド
  # def notice_slack(message)
  #   notifier = Slack::Notifier.new(
  #     Rails.application.credentials[:WEBHOOK_URL],
  #     channel: "test-onigo-notifier",
  #     username: '獲得速報'
  #   )

  #   notifier.ping(message)
  # end

  # def notifier
  #   url = Rails.configuration.x.app.WEBHOOK_URL # 追記
  #   Slack::Notifier.new(url, username: '通知Bot', icon_emoji: ':sunglasses:')
  # end

  # slack通知用メソッド
  # def notice_slack(message)
  #   notifier = Slack::Notifier.new(
  #     ENV['SLACK_WEBHOOK_URL'],
  #     channel: "##{ENV['SLACK_CHANNEL']}",
  #     username: '獲得速報'
  #   )

  #   notifier.ping(message)
  # end

  # def notifier
  #   url = Rails.configuration.x.app.webhook_url
  #   Slack::Notifier.new(
  #     url,
  #     username: '獲得速報',
  #     icon_emoji: ':sunglasses:'
  #   )
  #   # Slack::Notifier.new(WEBHOOK_URL).ping('<!here> メッセージ内容をここに記載')
  # end


  # def notice_page_info(page)
  #   # 本文を生成
  #   message = <<~"EOS"
  #     契約1件獲得しました！

  #     【催事】#{Store.find(Report.find(page.report_id).store_id).name}
  #     【氏名】#{page.customer_name}　様
  #     【備考】#{page.memo}

  #     よろしくお願い致します。
  #   EOS
  #   # Slack通知処理を呼び出し
  #   notice_slack(message)
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