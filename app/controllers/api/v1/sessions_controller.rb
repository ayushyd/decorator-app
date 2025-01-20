module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request, only: [:login]

      def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          render json: { message: "User logged in successfully!", token: token, current_user: UserSerializer.new(user) }, status: :ok
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end

      def logout
        token = request.headers["Authorization"]&.split( )&.last

        if token
          JwtBlacklist.create(token: token)
          render json: { message: "User logged out successfully!" }, status: :ok
        else
          render json: { error: "No token provided or token invalid" }, status: :unprocessable_entity
        end
      end
    end
  end
end
