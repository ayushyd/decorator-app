class PaymentQuery

	def initialize(relation = Payment.all)
		@relation = relation
	end

	def call(user, start_date, end_date, status)
		@relation.where(status: true).where(created_at: start_date..end_date)
	end
end