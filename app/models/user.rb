class User < ApplicationRecord
  has_secure_password

  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :name, presence: true
	validates :password, :password_confirmation, presence: true, length: {minimum: 8}

	has_many :songs
	has_many :lists, through: :songs
	

	before_save :email_lowercase

	def email_lowercase
		email.downcase!
	end

end
