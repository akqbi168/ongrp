class HomesController < ApplicationController

  def top
    @user = current_user
    @report_today = Report.where(user_id: @user, date: Date.current)
  end

end
