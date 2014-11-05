class ErrorsController < ApplicationController

  layout false

  def error404
    render status: :not_found
  end

  def error400
    render status: :bad_request
  end

  def error500
    render status: :internal_server_error
  end
end