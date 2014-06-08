require 'spec_helper'

describe Post do   
	describe 'validations' do
		it "should have text in field" do
			post = Post.new(text: nil, title: 'my title')
			expect(post).to_not be_valid # post.valid?
			expect(post).to have(1).errors_on(:text)
		end

		it "should be more than 5 characters" do
			post = Post.new(text: 'test', title: 'a')
			expect(post).to_not be_valid # post.valid?
			expect(post).to have(1).errors_on(:title) # error should be on that attribute
		end
	end
end



