class RegistrationsController <Devise::RegistrationsController
	before_filter 	:configure_permitted_parameters, if: :devise_controller?#:only => [:create]

	private

	# def sign_up_params
	# 	params.require(:user).permit(:username, :last_name, :first_name, :email, :password, :password_confirmation)
	# end
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :last_name, :first_name, :email, :password, :password_confirmation])
	end

	def account_update_params
		params.require(:user).permit(:username, :last_name, :first_name, :email, :password, :password_confirmation,
		:current_password, :role)
	end

end