class User < ActiveRecord::Base
	attr_accessible :name, :email, :password ,:password_confirmation
	attr_accessor	:password

	validates :name, 	:presence => true,
						:length	=> {:maximum => 50}
	validates :email, 	:presence => true,
						:uniqueness	=> {:case_sensitive => false}
	validates :password,:presence => true,
						:confirmation => true,
						:length => {:within => 6..40}

	before_save :encrypt_password

	def has_password?(submitted_password)
		encryped_password == encrypt(submitted_password)
	end 

	class << self
		def authenticate(email, submitted_password)
			user = find_by_email(email)
			return nil 	if user.nil?
			return user if user.has_password?(submitted_password)
		end
	end

	private 
		def encrypt_password
			self.encryped_password = encrypt(password)
		end

		def encrypt(string)
			string
		end

end