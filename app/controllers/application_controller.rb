class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing_error

  private

  def render_parameter_missing_error(exception)
    render json: { errors: exception.message }, status: :unprocessable_entity
  end
end
