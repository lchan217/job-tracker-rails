class SourcesController < ApplicationController
    def index
        sources = Source.all

        render :index, locals: { sources: sources }
    end

    def subtotal
        sources = Source.subtotal
        render :subtotal, locals: { sources: sources }
    end
end