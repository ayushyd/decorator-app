module PaymentsHelper

	def payment_symbol(payment)
		number_to_currency(payment.amount, unit:  "₹", delimiter: ",", format: "%u%n")
	end
end
