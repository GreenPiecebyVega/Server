class Usuarios::SessionsController < Devise::SessionsController
    before_action :config_sign_in_params, only: [:create]  
    
    skip_before_action :require_no_authentication, :only => [:create]
  
    # POST /resource/sign_in
    # def create    
    #     self.resource = warden.authenticate!(auth_options)
    #     sign_in(resource_name, resource)
    # end
  
    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end
  
    # protected
    # If you have extra params to permit, append them to the sanitizer.
    def config_sign_in_params
        devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
  