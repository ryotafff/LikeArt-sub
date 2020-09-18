class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


protected
    def after_sign_in_path_for(resource)
      if resource == :admin
        admins_users_path
      else
        root_path
      end
    end


    def after_sign_out_path_for(resource)
    	if resource == :admin
      new_admin_session_path
      else
      root_path
      end
    end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email,:profile_image_id ])
  end

end
