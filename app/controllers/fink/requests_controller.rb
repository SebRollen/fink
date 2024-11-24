
module Fink
  class RequestsController < Fink::ApplicationController
    def index
      @requests = Fink::Request.all
    end

    def show
      @request = Fink::Request.find(params[:id])
    end
  end
end
