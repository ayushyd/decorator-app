class PaymentPresenter
  def initialize(payment)
    @payment = payment
  end

  def display_status
    case @payment.status
    when "accepted"
      "Accepted"
    when "rejected"
      "Rejected"
    else
      "Unknown"
    end
  end
end

