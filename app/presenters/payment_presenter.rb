class PaymentPresenter

	def initialize(payment)
		@payment = payment
	end

	def display_status
		@payment.status ? "Accepted" : "Rejected"	
	end
end