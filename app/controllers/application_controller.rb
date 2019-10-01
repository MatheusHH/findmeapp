class ApplicationController < ActionController::Base
  include Pundit
	before_action :configure_permitted_parameters, if: :devise_controller?
	layout :layout_by_resource

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	
  	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  	end

  	def after_sign_in_path_for(resource)
  		home_index_path
	  end

    def after_sign_out_path_for(resource_or_scope)
      user_session_path
    end

	private

  	def layout_by_resource
    	if devise_controller?
      		"userdevise"
    	else
      		"application"
    	end
  	end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

end
