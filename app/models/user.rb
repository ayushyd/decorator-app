class User < ApplicationRecord
  has_secure_password
  encrypts :name, deterministic: true

  enum role: {admin: "admin", subadmin: "subadmin", customer: "customer"}

  scope :recent, -> {where.not(role: "customer")}

  has_many :payments, dependent: :destroy


  def safe_name
    begin
      self.name
    rescue ActiveRecord::Encryption::Errors::Decryption => e
      Rails.logger.error "Decryption error for user ##{self.id}: #{e.message}"
      "Decryption failed"
    end
  end
 
end
