class JobsController < ApplicationController
    def index
        @jobs = Job.all
    end

    def show
    end
    
    def new
        @job = Job.new
    end

    def create
        Job.import(params[:job][:file])
        flash[:notice] = "Jobs uploaded successfully"
        redirect_to jobs_path
    end

    private

    def job_params
        params.require(:job).permit(:title, :company_name, :url, :source)
    end
end
