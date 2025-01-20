module Api
		class ApplicationController < ActionController::API

			before_action :authenticate_request

			def authenticate_request
				token = request.headers["Authorization"]&.split( )&.last

				decode_token = JsonWebToken.decode(token)

				if JwtBlacklist.exists?(token: token)
					render json: {error: "Token has been black list"}, status: :unauthorized

					 return
			    end	

			    if decode_token

			        @current_user = User.find_by(id: decode_token[:user_id])
			    else
			    
			       render json: {error: "unauthorized"}
			    end    
			end

			def current_user_api
				@current_user
			end
		end
end