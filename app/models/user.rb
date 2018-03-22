class User < ApplicationRecord
	has_many :words
	has_secure_password

	validates :password, confirmation: true
end
