class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :change_weekday_format

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_id])
  end

  def change_weekday_format
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end

end
