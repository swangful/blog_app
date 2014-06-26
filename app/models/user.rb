class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, length: { minimum: 6 } 
	validates_confirmation_of :password
	has_many :posts
	has_many :comments
	has_many :microposts

	SECRET_KEY = 'foobar'

	before_create :assign_password

	def is_password?(password)
		Digest::SHA1.hexdigest("#{password}#{SECRET_KEY}") == hashed_password
	end

	def assign_password
		self.hashed_password = Digest::SHA1.hexdigest("#{password}#{SECRET_KEY}")
	end

	def send_password_reset
  		generate_token(:password_reset_token)
  		self.password_reset_sent_at = Time.zone.now
  		save!
  		UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
  		begin
  		self[column] = SecureRandom.urlsafe_base64
  		end while User.exists?(column => self[column])
end
end
