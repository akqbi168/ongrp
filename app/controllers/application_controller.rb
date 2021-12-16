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

  def admin_only
    unless current_user.account_level == 'admin'
      redirect_to root_path, flash: { alert: 'エラー(A01)：管理者に連絡してください。' }
    end
  end

  def manager_level_only
    unless current_user.account_level == 'manager' || current_user.account_level == 'admin'
      redirect_to root_path
    end
  end

  def hq_admin_level_only
    unless current_user.account_level == 'headquarter_admin' || current_user.account_level == 'manager' || current_user.account_level == 'admin'
      redirect_to root_path
    end
  end

  def no_director_and_no_client
    unless current_user.account_level == 'headquarter' || current_user.account_level == 'headquarter_admin' || current_user.account_level == 'manager' || current_user.account_level == 'admin'
      redirect_to root_path, flash: { alert: 'エラー(A99)：権限がありません。' }
    end
  end

  def no_director
    unless current_user.account_level == 'client' || current_user.account_level == 'headquarter' || current_user.account_level == 'headquarter_admin' || current_user.account_level == 'manager' || current_user.account_level == 'admin'
      redirect_to root_path, flash: { alert: 'エラー(A99)：権限がありません。' }
    end
  end

  def no_client
    unless current_user.account_level == 'director' || current_user.account_level == 'headquarter' || current_user.account_level == 'headquarter_admin' || current_user.account_level == 'manager' || current_user.account_level == 'admin'
      redirect_to root_path, flash: { alert: 'エラー(A99)：権限がありません。' }
    end
  end

  def current_user_only
    unless current_user == User.find(session[:user_id])
      redirect_to root_path
    end
  end

    # undefined: 0,
    # director: 1,
    # client: 2,
    # headquarter: 3,
    # headquarter_admin: 4,
    # manager: 5,
    # admin: 6

end
