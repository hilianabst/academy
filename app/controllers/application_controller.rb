class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :configure_permited_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        trainings_path(current_user) # your path
    end

    def authenticate_admin!
        redirect_to new_user_session_path unless (!current_user.nil? && current_user.admin)
        flash[:danger] = "No tienes autorización para entrar en esa sección"
    end
    
    protected
    def configure_permited_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    end
end
