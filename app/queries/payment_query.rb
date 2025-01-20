class PaymentQuery

	def initialize(relation = Payment.all)
		@relation = relation
	end

	def call(user: nil, amount: nil, payment_id: nil, start_date:, end_date:, status:nil)
		query = @relation

		query = query.where(user: user) if user
		query = query.where(amount: amount) if amount
		query = query.where(payment_id: payment_id) if payment_id
		query = query.where(status: status) if status
		query = query.where(created_at: start_date..end_date) if start_date && end_date
		query
	end
end