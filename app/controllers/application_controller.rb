class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit({ role_ids: [] }, :email, :password, :password_confirmation, :name)
  	end
  	devise_parameter_sanitizer.permit(:account_update) do |user_params|
    	user_params.permit({ role_ids: [] }, :email, :password, :current_password,
                                      	:password_confirmation, :name)
  	end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.default_message = "No tienes permisos para acceder a esta página."
    redirect_to root_path
  end
end
