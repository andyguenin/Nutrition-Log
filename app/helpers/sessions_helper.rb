module SessionsHelper

	def redirect_if_not_signed_in
		unless signed_in?
			session[:redirection_url] = request.url
			redirect_to signin_url
		end
	end

	def redirect_if_not_admin
		if signed_in?
			unless current_user.admin?
				redirect_to root_path
			end
		else
			redirect_if_not_signed_in
		end
	end


  def  sign_in(user,remember=true)
		if remember
			cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		else
			session[:remember_token] = [user.id, user.salt]
		end
		self.current_user = user
	end
		
	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= user_from_remember_token
	end

	def signed_in?
		!current_user.nil?
	end
	
	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
	end
	private
		def user_from_remember_token
			User.authenticate_with_salt(*remember_token)
		end

		def remember_token
			cookies.signed[:remember_token] || [nil,nil]
		end
end
