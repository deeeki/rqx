class RequestsController < ApplicationController
  before_action :set_request, only: [:show]
  skip_before_action :verify_authenticity_token, only: [:create]
  http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'], password: ENV['BASIC_AUTH_PASS'] if Rails.env.production?

  def index
    @requests = Request.all
  end

  def show
  end

  def create
    @request = Request.new_from_http_request(request)

    if @request.save
      head :ok
    else
      head :bad_request
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end
end
