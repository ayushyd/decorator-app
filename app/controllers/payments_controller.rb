class PaymentsController < ApplicationController
	include PaymentsHelper
  before_action :set_user

  def index
    @payments = PaymentQuery.new.call(user: @user,
      amount: params[:amount], payment_id: params[:payment_id],status: params[:status], start_date: params[:start_date], end_date: params[:end_date])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = ::PaymentService.new(@user, params).create
     if @payment 
      flash[:notice] = "Payment was created successfully"
      redirect_to user_payments_path
    else
      flash[:alert] = @payment.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
    unless @user
      flash[:alert] = "User not found"
      redirect_to root_path
    end
  end
end
