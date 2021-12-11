class JobsController < ApplicationController

  def index
    @q = Job.ransack(params[:q])
    # @results = @q.result.includes(:date).order("date")
    @results = @q.result.order("date")

    @date_origin = Date.new(2021,8,1)
    @staffs = Staff.all.order("id")
    @jobs_by_date = Job.all.order("date")
    @stores = Store.all.order("id")
  end

  def show
  end

  def new
    @job = Job.new
    @ranks = Rank.all.order("per_hour")
    @staffs = Staff.all
    # @@path = Rails.application.routes.recognize_path(request.referer)
  end

  def edit
    # @@path = Rails.application.routes.recognize_path(request.referer)
    @job = Job.find(params[:id])
    @ranks = Rank.all.order("per_hour")
    @staffs = Staff.all
  end

  def create
    @@path = Rails.application.routes.recognize_path(request.referer)
    @job = Job.new(job_params)

    job_record = Job.find_by(date: job_params[:date], staff_id: job_params[:staff_id])

    if job_record.present?
      flash.now[:alert] = "勤務がすでに登録されています。更新する場合はシフト一覧から該当データを選択してください。"
      render 'new'
    else

      if @job.save
        @payment = Payment.new
        @payment.staff_id = @job.staff_id
        @payment.date = @job.date
        @payment.job_id = @job.id
        @payment.time_start = @job.time_start
        @payment.time_end = @job.time_end
        @payment.time_break = @job.time_break
        @payment.working_hours = (@job.time_end - @job.time_start) / 3600 - (@job.time_break / 60)
        @payment.per_hour = Rank.find(@job.rank_id).per_hour
        @payment.save
        if @@path[:controller] == "jobs"
          redirect_to jobs_path, flash: { notice: 'シフトを追加しました。' }
        elsif @@path[:controller] == "staffs"
          redirect_to new_job_path, flash: { notice: 'シフトを追加しました。' }
        end
      else
        flash.now[:alert] = "追加できませんでした。入力項目を確認してください。"
        render 'new'
      end
    end
  end

  def update
    @@path = Rails.application.routes.recognize_path(request.referer)
    @job = Job.find(params[:id]) # このidで上書きする予定。データはDBのもので、フォーム送信データを含まず。
    job_record = Job.find_by(date: job_params[:date], staff_id: job_params[:staff_id]) # 上書き前のデータ
    job_current = Job.new(job_params) # フォームからの送信データ。未保存。

    # job_recordがあるなら（日付やスタッフが元データと同じなら）
    #   job_recordのidとtparamsのidが違うなら ＝ 勝手に不本意に上書きされようとしているなら
    #     render 'edit'
    #   job_recordのidとparamsのidが同じなら ＝ 単に元のデータを修正しようとしているだけなら
    #     普通にアップデートする
    # job_recordがなければ（updateでデータが別日に移るorスタッフが変わったら）
    #   普通にアップデートする

    if job_record.present?
      if job_record.id != @job.id
        flash.now[:alert] = "勤務がすでに登録されています。更新する場合はシフト一覧から該当データを選択してください。"
        render 'edit'
      else
        if Payment.find_by(job_id: @job.id)
          @payment = Payment.find_by(job_id: @job.id)
        else
          @payment = Payment.new
        end

        @payment.staff_id = job_current.staff_id
        @payment.date = job_current.date
        @payment.job_id = job_current.id
        @payment.time_start = job_current.time_start
        @payment.time_end = job_current.time_end
        @payment.time_break = job_current.time_break
        @payment.working_hours = (job_current.time_end - job_current.time_start) / 3600 - (job_current.time_break / 60)
        @payment.per_hour = Rank.find(job_current.rank_id).per_hour

        if @job.update(job_params) && @payment.update(
          staff_id: job_current.staff_id,
          date: job_current.date,
          job_id: @job.id,
          time_start: job_current.time_start,
          time_end: job_current.time_end,
          time_break: job_current.time_break,
          working_hours: (job_current.time_end - job_current.time_start) / 3600 - (job_current.time_break / 60),
          per_hour: Rank.find(job_current.rank_id).per_hour
        )
          if @@path[:controller] == "jobs"
            redirect_to jobs_path, flash: { notice: 'シフトを追加しました。' }
          elsif @@path[:controller] == "staffs"
            redirect_to new_job_path, flash: { notice: 'シフトを追加しました。' }
          end
        else
          flash.now[:alert] = "修正できませんでした。入力項目を確認してください。"
          render 'edit'
        end
      end

    else
      if Payment.find_by(job_id: @job.id)
        @payment = Payment.find_by(job_id: @job.id)
      else
        @payment = Payment.new
      end

      @payment.staff_id = job_current.staff_id
      @payment.date = job_current.date
      @payment.job_id = job_current.id
      @payment.time_start = job_current.time_start
      @payment.time_end = job_current.time_end
      @payment.time_break = job_current.time_break
      @payment.working_hours = (job_current.time_end - job_current.time_start) / 3600 - (job_current.time_break / 60)
      @payment.per_hour = Rank.find(job_current.rank_id).per_hour

      if @job.update(job_params) && @payment.update(
        staff_id: job_current.staff_id,
        date: job_current.date,
        job_id: @job.id,
        time_start: job_current.time_start,
        time_end: job_current.time_end,
        time_break: job_current.time_break,
        working_hours: (job_current.time_end - job_current.time_start) / 3600 - (job_current.time_break / 60),
        per_hour: Rank.find(job_current.rank_id).per_hour
      )
        if @@path[:controller] == "jobs"
          redirect_to jobs_path, flash: { notice: 'シフトを追加しました。' }
        elsif @@path[:controller] == "staffs"
          redirect_to new_job_path, flash: { notice: 'シフトを追加しました。' }
        end
      else
        flash.now[:alert] = "修正できませんでした。入力項目を確認してください。"
        render 'edit'
      end
    end
  end

  def search
  end

  private

  def job_params
    params.require(:job).permit(:staff_id, :date, :rank_id, :store_id, :time_start, :time_end, :time_break)
  end

end
