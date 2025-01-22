class SubscriptionsController < ApplicationController

	def new
		 @stripe_publishable_key = Rails.application.credentials.dig(:stripe, :publishable_key)

		 @plan_id = [
		 		{ id: 'price_12345', name: 'Basic Plan', price: 10 },
                { id: 'price_67890', name: 'Pro Plan', price: 20 },
		 	]
	end

	def create
		customer = current_user.customer
		plan_id = params[:plan_id]

		subscription = Stripe::Subscription.create({
			customer: customer.stripe_customer_id,
			items: [{price: plan_id}],
			expand: ['latest_invoice.payment_intent']
		})

		current_user.create_subscription(
			stripe_subscription_id: subscription.id,
			status: subscription.status,
			current_period_end: Time.at(subscription.current_period_end)
			)

			render json: {success: true, subscription: subscription}

		rescue Stripe::CardError => e
			render json: {error: e.message}, status: :unprocessable_entity
	end

	def destroy
		subscription = current_user.subscription

		Stripe::Subscription.update(subscription.stripe_subscription_id, {
			cancel_at_period_end: true,
		})

		subscription.update(status: 'canceled')
		redirect_to root_path, notice: 'Your subscription will be canceled at the end of the billing period.'
	end
end
