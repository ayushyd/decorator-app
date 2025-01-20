class JwtBlacklist < ApplicationRecord
	validates :token, presence:true, uniqueness: true
end
