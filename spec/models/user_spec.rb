require 'spec_helper'

describe User do
	include UsersHelper

	it "should have_many posts" do
		user = User.create({email: 'swang@swang.com', name: "Steve Wang", password: 'password'})
		post = Post.create({title: 'testing rspec test', text: "testing"})
		user.posts << post
		user.save
		expect(user.reload.posts).to include(post)
	end

	it "should have_many comments" do 
		user = User.create({email: 'swang@swang.com', name: "Steve Wang", password: 'password'})
		post = Post.create({title: 'testing rspec test', text: "testing"})
		comment = Comment.create({commenter: 'swang', body: 'This is a comment.'})
		user.comments << comment
		user.save
		expect(user.reload.comments).to include(comment)
	end

	it "should create a user" do
		user = User.create({email: 'foobar@foobar.com', name: "Ray Chen", password: 'password'})
		expect(user).to be_kind_of(User) # be_*
		expect(user.reload.email).to eql('foobar@foobar.com')
		expect(user.reload.name).to eql('Ray Chen')
		# kind_of?(User)
	end

	it "should be not valid if a user has that name already" do
		user = User.create({email: 'swang@swang.com', name: "Steve Wang"})
		user_with_same_name = user.dup
		user_with_same_name.save
		expect(user_with_same_name).to_not be_valid
		#? expect(user, :name).to_not eql(user2, :name)
	end

	it "should not be valid if a user has that email already" do
		# Missing the validation on app/models/user.rb

		# Create a user with email as 'asdf@asdf.com'
		# Create makes a user and saves it in the Test database.yml
		user = User.create({email: 'asdf@asdf.com', name: "Ray Chen"})
		# BUILD a user with email as 'asdf@asdf.com' 
		# User.new or BUILD, creates a user but does not save the user in database.yml
		user2 = User.new({email: 'asdf@asdf.com', name: "Bob Chen"})
		# expect that the second user is not valid
		# user.valid? # true/false
		expect(user2).to_not be_valid # valid?

		# TODO: expect that the error is on email
		expect(user2.email).to_not eql(id: user)
	end

	it "is invalid without a name" do
		user = User.new
		expect(user).to_not be_valid
	end

	it "should have a password with minimum length of 6 characters" do
		user = User.create({email: 'swang@swang.com', name: "Steve Wang", password: 'word'})
		expect(user).to_not be_valid
	end

	it "should have a matching password confirmation" do
		user = User.create({email: 'swang@swang.com', name: "Steve Wang", password: 'password', password_confirmation: 'pass'})
		expect(user).to_not be_valid
	end
end