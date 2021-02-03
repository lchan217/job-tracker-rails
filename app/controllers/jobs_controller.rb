class JobsController < ApplicationController
    def index
        source = Source.find(params[:source_id])
        jobs = source.jobs

        render :index, locals: { source: source, jobs: jobs}
    end
    
    def new
        @job = Job.new
    end

    def create
        Job.import(params[:job][:file])
        flash[:notice] = "Jobs uploaded successfully"
        redirect_to sources_path
    end

    private

    def job_params
        params.require(:job).permit(:title, :company_name, :url, :source)
    end
end
