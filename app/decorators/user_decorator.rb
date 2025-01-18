class UserDecorator

	def initialize(user)
		@user = user
	end

	def make_email
		email_part = @user.email.split('@')
		"#{email_part[0][0]}****@#{email_part[1]}"
	end

	def display_name
		"User:#{@user.safe_name}"
	end

	def is_role
		"#{@user.role}"
	end
end