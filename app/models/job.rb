class Job < ApplicationRecord
    require 'csv'

    belongs_to :source

    validates :url, uniqueness: true

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
        if !url
            source = Source.find_by(name: "Source Unknown")
        else

            if source = Source.all.find { |source| url.match?(source.root_domain.downcase) if source.root_domain.present? } || Source.all.find { |source| url.match?(source.name.downcase)}
                
            elsif Source.all.find { |source| url.match?(Regexp.union(["careers", "jobs", company_name.downcase.gsub(/\s+/, "")]))}
                source = Source.find_by(name: "Company Website")
            else
                source = Source.find_by(name: "Source Unknown")
            end
        end
        update(source_id: source.id)
    end

    private

    def clean_string(string)
        string.downcase.gsub(/\s+/, "") 
    end
end