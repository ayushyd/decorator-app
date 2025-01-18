class PaymentService
  def initialize(user, params)
    @user = user
    @params = params
  end

  def create
    payment = @user.payments.build(payment_params) 
    if payment.save
      payment
    else
      raise StandardError, payment.errors.full_messages.join(", ")
    end
  end

  private

  def payment_params
    @params.require(:payment).permit(:amount, :payment_id, :status)
  end
end
