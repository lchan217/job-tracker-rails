class Job < ApplicationRecord
    require 'csv'

    belongs_to :source

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            job = Job.new
            job.title = row[1]
            job.company_name = row[2]
            job.url = row[3]
            job.find_source
            job.save
        end
    end

    def find_source
        if source = Source.all.find { |source| url.match?(source.name.downcase)} || Source.all.find { |source| url.match?(source.root_domain.downcase) if source.root_domain.present? }
            update!(source_id: source.id)
        elsif source = Source.all.find { |source| url.match?(Regexp.union(["careers", "jobs"]))}
            update!(source_id: source.id)
        else
            source = Source.find_by(name: "Source Unknown")
            update!(source_id: source.id)
        end
    end

    private

    def clean_string(string)
        string.downcase.gsub(/\s+/, "") 
    end
end