class ApplicationController < ActionController::Base
  include Pundit
	before_action :configure_permitted_parameters, if: :devise_controller?
	layout :layout_by_resource

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::DeleteRestrictionError, with: :impossible_to_delete
	
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

    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore

      flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_to(request.referrer || root_path)
    end

    def impossible_to_delete
      flash[:alert] = "You cannot delete this record because exists another related ."
      redirect_to(request.referrer || root_path)
    end

end
