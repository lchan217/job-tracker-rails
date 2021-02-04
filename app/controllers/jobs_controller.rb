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
        if params[:job].nil?
            flash[:alert] = "Please upload a file."
            redirect_to new_job_path
        else
            import(params[:job][:file])
            if flash[:error]
                flash[:alert] = flash[:error]
                redirect_to new_job_path
            else
                flash[:notice] = "Jobs uploaded successfully"
                redirect_to sources_path
            end
        end
    end

    private

    def job_params
        params.require(:job).permit(:title, :company_name, :url, :source)
    end


    def import(file)
        begin
            CSV.foreach(file.path, headers: true) do |row|
                job = Job.new
                job.title = row[1]
                job.company_name = row[2]
                job.url = row[3]
                job.find_source
                job.save!

            end
        rescue 
            flash[:error] = "A job URL in this spreadsheet is already taken. Please delete that line and try again."
        end
    end
end
