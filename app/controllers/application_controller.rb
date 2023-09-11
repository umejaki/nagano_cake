class ApplicationController < ActionController::Base
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  
   def after_sign_in_path_for(resource)
    customer_registration_path
   end
   
   def after_sign_out_path_for(resource)
    
     new_customer_session_path
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
  end
 
end
