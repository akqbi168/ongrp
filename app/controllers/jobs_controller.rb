class JobsController < ApplicationController

  def index
    @q = Job.ransack(params[:q])
    # @results = @q.result.includes(:date).order("date")
    @results = @q.result.order("date")

    @date_origin = Date.new(2021,11,1)
    @staffs = Staff.all.order("id")
    @jobs_by_date = Job.all.order("date")
    @stores = Store.all.order("id")
  end

  def show
  end

  def new
    @job = Job.new
    # @@path = Rails.application.routes.recognize_path(request.referer)
    @ranks = Rank.all.order("per_hour")
    @staffs = Staff.all
  end

  def edit
    # @@path = Rails.application.routes.recognize_path(request.referer)
    @job = Job.find(params[:id])
    @ranks = Rank.all.order("per_hour")
    @staffs = Staff.all
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      @rank = Rank.all
      @payment = Payment.new
      @payment.staff_id = @job.staff_id
      @payment.date = @job.date
      @payment.job_id = @job.id
      @payment.time_start = @job.time_start
      @payment.time_end = @job.time_end
      @payment.time_break = @job.time_break
      @payment.working_hours = (@job.time_end - @job.time_start) / 3600 - (@job.time_break / 60)
      @payment.per_hour = @rank.find(@job.rank_id).per_hour
      @payment.save
        # if @@path[:controller] == "jobs" && @@path[:action] == "index"
          redirect_to jobs_path, flash: { notice: 'シフトを追加しました。' }
        # else
          # redirect_to new_job_path, flash: { notice: 'シフトを追加修正しました。' }
        # end
    else
      render 'new'
    end
  end

  def update
    @job = Job.find(params[:id])

    @rank = Rank.all
    @payments = Payment.all
    if @payments.find_by(job_id: @job.id)
      @payment = Payment.find_by(job_id: @job.id)
    else
      @payment = Payment.new
    end
    @payment.staff_id = @job.staff_id
    @payment.date = @job.date
    @payment.job_id = @job.id
    @payment.time_start = @job.time_start
    @payment.time_end = @job.time_end
    @payment.time_break = @job.time_break
    @payment.working_hours = (@job.time_end - @job.time_start) / 3600 - (@job.time_break / 60)
    @payment.per_hour = @rank.find(@job.rank_id).per_hour

    if @job.update(job_params) && @payment.save

      redirect_to jobs_path, flash: { notice: 'シフトを修正しました。' }
    else
      render 'edit'
    end
  end

  def search
  end

  private

  def job_params
    params.require(:job).permit(:staff_id, :date, :rank_id, :store_id, :time_start, :time_end, :time_break)
  end

end
