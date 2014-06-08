require 'spec_helper'

describe Post do	

	it "should belong_to user" do
		user = User.create({email: 'swang@swang.com', name: "Steve Wang"})
		post = Post.create({title: 'testing rspec test', text: "testing"})
		user.posts << post
		user.save
		expect(post).to belong_to(user)
	end

	it "should have_many comments" do 
		user = User.create({email: 'swang@swang.com', name: "Steve Wang"})
		post = Post.create({title: 'testing rspec test', text: "testing"})
		comment = Comment.create({commenter: 'swang', body: 'This is a comment.'})
		user.posts << post
		user.comments << comment
		user.save
		expect(user.reload.comments).to include(comment)
	end
end
