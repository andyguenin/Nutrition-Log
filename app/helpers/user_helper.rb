module UserHelper
	def user_params
		params[:user].slice(:name, :email, :password, :password_confirmation)
	end
end
