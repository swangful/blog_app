module SessionsHelper
	def current_user
		self.current_user = user
	end

	def current_user?
		!current_user.nil?
	end
end
