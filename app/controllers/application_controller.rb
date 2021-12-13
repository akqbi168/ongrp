class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :change_weekday_format

  # before_action :error_messages

  protected

  # user_idでログインできるようにする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_id])
  end

  # 曜日を日本語にする
  def change_weekday_format
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end

  # slack通知用メソッド
  # def notice_slack(message)
  #   notifier = Slack::Notifier.new(
  #     ENV['SLACK_WEBHOOK_URL'],
  #     channel: "##{ENV['SLACK_CHANNEL']}",
  #     username: '獲得速報'
  #   )

  #   notifier.ping(message)
  # end

end
