class UserObserver < ActiveRecord::Observer

	def after_create(user)
		UserMailer.welcome_email(user).deliver_now
	end
end
