class PaysController < ApplicationController

	def new
		@stripe_publishable_key = Rails.application.credentials.dig(:stripe, :publishable_key)
	end

	def create
		customer = current_user.customer
		payment_intent = Stripe::PaymentIntent.create({
			amount: params[:amount],
			currency: 'usd',
			customer: customer.stripe_customer_id,
			payment_method: params[:payment_method_id],
			off_session: true,
			confirm: true,
		})

		render json: {success: true, payment_intent_id: payment_intent.id}
	rescue Stripe::CardError => e
		render json: {error: e.message}, status: :unprocessable_entity
	end
end