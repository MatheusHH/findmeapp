class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	layout :layout_by_resource
	
  	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  	end

  	def after_sign_in_path_for(resource)
  		home_index_path
	end

	private

  	def layout_by_resource
    	if devise_controller?
      		"userdevise"
    	else
      		"application"
    	end
  	end

end
