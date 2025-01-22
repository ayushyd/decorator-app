class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, :webhook_secret)

    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      render json: { error: 'Invalid payload' }, status: :bad_request
      return
    rescue Stripe::SignatureVerificationError => e
      render json: { error: 'Invalid signature' }, status: :bad_request
      return
    end

    case event['type']
    when 'customer.subscription.updated', 'customer.subscription.created'
      subscription = event['data']['object']
      user = User.joins(:subscription).find_by(subscriptions: { stripe_subscription_id: subscription.id })

      if user
        user.subscription.update(
          status: subscription.status,
          current_period_end: Time.at(subscription.current_period_end)
        )
      end
    when 'invoice.payment_failed'
      subscription = event['data']['object']['subscription']
      user = User.joins(:subscription).find_by(subscriptions: { stripe_subscription_id: subscription })

      if user
        # Notify the user about payment failure
      end
    end

    head :ok
  end
end
