class User < ApplicationRecord
  has_secure_password
  encrypts :name, deterministic: true

  enum role: {admin: "admin", subadmin: "subadmin", customer: "customer"}

  scope :recent, -> {where.not(role: "customer")}

  has_many :payments, dependent: :destroy

  has_one :customer, dependent: :destroy

  has_one :subscription, dependent: :destroy


  def safe_name
    begin
      self.name
    rescue ActiveRecord::Encryption::Errors::Decryption => e
      Rails.logger.error "Decryption error for user ##{self.id}: #{e.message}"
      "Decryption failed"
    end
  end

  after_create :create_stripe_customer

  def subscribed?
      subscription&.status == "active"    
  end

  private

  def create_stripe_customer
    customer = Stripe::Customer.create(email: self.email, name: self.name)
    self.create_customer(stripe_customer_id: customer.id)
  end
 
end
