class JobsController < ApplicationController
    def index
        source = Source.find(params[:source_id])
        jobs = source.jobs.paginate(page: params[:page], per_page: 20)

        render :index, locals: { source: source, jobs: jobs}
    end
    
    def new
        @job = Job.new
    end

    def create
        if params[:job].nil?
            flash[:alert] = "Please upload a file."
            redirect_to new_job_path
        else
            Job.import(params[:job][:file])
            flash[:notice] = "Jobs uploaded successfully"
            redirect_to sources_path
        end
    end

    private

    def job_params
        params.require(:job).permit(:title, :company_name, :url, :source)
    end
end