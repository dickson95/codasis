class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
	flash[:warning] = exception.message
	redirect_to root_path
  end
 
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

end
