class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, unless: -> { request.format.html? }

  def json_response(obj, status = :ok)
    render(json: obj, status: status) and return if obj.valid?

    render json: {errors: obj.errors.messages}, status: :unprocessable_entity
  end

  def json_message(message, status = :ok)
    render json: {message: message}, status: status
  end
end
