module Api
	module V1
		class RegistrationsController < ApplicationController
			before_action :authenticate_request, only: [:index]

			def index
				current_user_api
				render json: {current_user: UserSerializer.new(current_user_api) }
			end

			def create
				@user = User.new(registration_params)
				@user.role ||= "customer"
				if @user.save 
					render json: {user: UserSerializer.new(@user)}, status: :ok 
				else 
				    render json: {error: @user.error.full_messages}, status: :not_found
				end	
			end

			private

			def registration_params
				params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
			end
		end
	end
end