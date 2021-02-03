class SourcesController < ApplicationController
    def index
        sources = Source.all

        render :index, locals: { sources: sources }
    end
end