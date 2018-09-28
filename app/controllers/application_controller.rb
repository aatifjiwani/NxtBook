class ApplicationController < ActionController::API
  before_action :verify_api_token
  
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end
  
  def verify_api_token
    if params[:token] != Rails.application.credentials.dig(:api_token) 
      render json: {
        "status": "error",
        "message": "API Token is Invalid"
        }, status: :unauthorized
    end
  end
  
  def verify_user_id
    @user = User.find_by(id: params[:user_id]) if params[:user_id].present?
    if @user.nil?
      respond_with_error("Invalid User")
    end
  end
  
  def respond_with_error(message, status: :unprocessable_entity)
    render(json: {status: "error", message: message}, status: status)
  end
end
