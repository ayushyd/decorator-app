module Api
	module V1
		class ForgetPasswordController < ApplicationController
          include JwtToken
			skip_before_action :authenticate_request

			def forget
				user = User.find_by(email: params[:email])
                
                if user

					reset_token = generate_token

					if user.update_column(reset_password_token: reset_token, reset_password_send_at: Time.now.utc)
						render json: {message: "Password reset token send successfully!", token: reset_token, reset_password_send_at: Time.now.utc }, status: :ok
					else 
					   render json: {error: "Failure to send token"}
					end 
				else

				   render json: {error: "Email not found"}
				end	  	
			end
		end
	end
end