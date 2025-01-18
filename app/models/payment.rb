class Payment < ApplicationRecord
  belongs_to :user

  validates_presence_of :status
  validates_presence_of :amount
  validates_presence_of :payment_id


  scope :actively, -> {where(status: true)}

  enum status: {
    accepted: true,
    rejected: false
  }

  after_create :send_mail

   private

    def send_mail
      PaymentMailer.payment_confirmation(self).deliver_now
    end

end
