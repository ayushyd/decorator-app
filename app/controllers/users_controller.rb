class UsersController < ApplicationController
	include UsersHelper
	before_action :authorize_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.recent
	end

	def show
		@user = User.find(params[:id])
		@decorate_user = ::UserDecorator.new(@user)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "User was Created Successfully!"
			redirect_to users_path
		else 
		   flash[:alert] = @user.errors.full_messages 
		   render :new, status: :unprocessable_entity
		end	
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		if @user
	        flash[:notice] = "User was Updated Successfully!"
			redirect_to root_path
	    else
	    
	       flash[:alert] = @user.errors.full_messages
	       render :edit, status: :unprocessable_entity
	    end		 
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "User was destroyed successfully"
			redirect_to root_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
	end

	def authorize_user
		user_policy = ::UserPolicy.new(current_user)

		unless user_policy.admin? || user_policy.name_blank?
			 flash[:alert] = "You are not authorized to perform this action."
			 redirect_to root_path
		end
	end
end
