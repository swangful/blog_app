require 'spec_helper'

describe Comment do
#Failing
  it "should belong_to user" do
    user = User.create({email: 'swang@swang.com', name: "Steve Wang"})
    post = Post.create({title: 'testing rspec test', text: "testing", user: post})
    comment = Comment.create({commenter: 'swang', body: 'This is a comment.', post: post, user: user})
    # comment.post = ### Post
    # comment.user = #### User
    # post.comments #  []
    # post.comments << comment # [] << 'a' # ['a'] << 'b'
    # User.create => User.new.save
		expect(comment.user).to eql(user)
	end

#Failing
  it "should belong_to post" do
  		user = User.create({email: 'swang@swang.com', name: "Steve Wang"})
  		post = Post.create({title: 'testing rspec test', text: "testing"})
  		comment = Comment.create({commenter: 'swang', body: 'This is a comment.'})
  		user.comments << comment
  		user.save
  		expect(comment).to belong_to(post)
  	end
end