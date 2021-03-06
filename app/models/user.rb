class User < ActiveRecord::Base
	has_many :albums
	attr_accessor :remember_token
	validates :email, presence: true, uniqueness: { case_senstitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }

	#Returns the hash digest
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																									BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	#Returns a random token
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	#Remember a user
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	#Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	#Forget a user
	def forget
		update_attribute(:remember_digest, nil)
	end
end

