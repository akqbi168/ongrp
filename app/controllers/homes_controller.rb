class HomesController < ApplicationController

  def top
    @user = current_user
    @report_today = Report.find_by(user_id: @user, date: Date.current)
    # @report_unsubmitted = Report.find_by(user_id: user, date: Date.current, is_submitted: false)
    @report_unsubmitted = Report.find_by(user_id: @user, date: Date.current)
  end

end
