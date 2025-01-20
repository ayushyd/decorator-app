module JwtToken extend 
	ActiveSupport::Concern

	def generate_token
		loop do 
			token = SecureRandom.hex(10)
			break token unless User exits? (reset_password_token: Time.now)	
		end
	end
end