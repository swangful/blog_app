class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, length: { minimum: 6 } 
	validates_confirmation_of :password
	has_many :posts
	has_many :comments
	has_many :microposts
end
