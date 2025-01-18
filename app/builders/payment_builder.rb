class PaymentBuilder

	def initialize(user)
		@payment = user.payments.build
	end

	def with_amount(amount)
		@payment.amount = amount
		self
	end

	def with_status(status)
		@payment.status = status
		self
	end

	def with_payment(payment_id)
		@payment.payment_id = payment_id
		self
	end

	def build
		@payment
	end
end