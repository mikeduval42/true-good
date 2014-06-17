class JobsController < ApplicationController
  def index
    @jobs = Job.all.reverse
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(set_params)
    if @job.save
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(set_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.delete
    redirect_to jobs_path
  end


protected

  def set_params
    params.require(:job).permit(:time_preference, :tools, :type_of_work, :time_estimate, :recurring, :location, :contact_phone, :contact_email)
  end

end
