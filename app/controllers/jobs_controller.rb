class JobsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  private

  def job_collection_params
      params.require(:form_job_collection)
      .permit(jobs_attributes: [:staff_id, :date, :time_start, :time_end, :time_break, :store_id, :rank])
  end

end
