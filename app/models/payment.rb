class Payment < ApplicationRecord
  belongs_to :user

  # validates_presence_of :status
  validates_presence_of :amount
  validates_presence_of :payment_id

  has_one_attached :avatar 


  # scope :actively, -> {where(status: :accepted)}

  enum status: {
    accepted: 1,
    rejected: 0
  }

  after_create :send_mail

   private

    def send_mail
      PaymentMailer.payment_confirmation(self).deliver_now
    end

end
