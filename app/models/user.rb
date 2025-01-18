class User < ApplicationRecord
  encrypts :name, deterministic: true

  enum role: {admin: "admin", subadmin: "subadmin"}

  scope :recent, -> {where("created_at > ?", 1.week.ago)}

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
