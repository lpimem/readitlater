class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
   devise_parameter_sanitizer.sanitize(:sign_up)
   params.require(:account).permit(:email, :password, profile_attributes: [:first_name, :last_name, :avatar])
  end
end
