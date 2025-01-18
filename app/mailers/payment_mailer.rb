class PaymentMailer < ApplicationMailer
	

	def payment_confirmation(payment)
		   @payment = payment     
		   mail(to: @payment.user.email, subject: "Payment Confirmation")
	end
end
