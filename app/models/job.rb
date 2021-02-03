class Job < ApplicationRecord
    require 'csv'

    belongs_to :source

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            job = Job.new
            job.title = row[1]
            job.company_name = row[2]
            job.url = row[3]
            # job.find_source
            job.save
        end
    end

    private

    def find_source
        binding.pr
        # Source.find ...
        # job board
        # company
        # unknown
    end
end