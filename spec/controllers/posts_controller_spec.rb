require 'spec_helper'

describe PostsController do
	let :user do 
		User.create({email: 'foobar@foobar.com', name: "Ray Chen", password: 'password'}) 
	end

	let :post do 
		post = Post.create({title: 'testing rspec test', text: "testing"})
	end

	describe 'get index' do
		it "should get successfully" do
			get :index
			expect(response).to be_success
		end
		
		it "should render template index" do
		    get :index
			response.should render_template(:index)
		end
	end

	describe 'post create' do
		it "should create successfully" do
			post :create, {post: {title: 'testing rspec test', text: "testing"}}
			expect(response).to be_success
		end

		it "creates a new post" do
			expect do
				post :create, {post: {title: 'testing rspec test', text: "testing"}}
				new_count = Post.count
				Post.new({title: 'testing rspec test', text: "testing"}) 
			end.to change{Post.count}.by(1)
		end	

	describe 'get new' do
		it "should get successfully" do
			get :new
			expect(response).to be_success
		end

		it "should render_template 'new'" do
			get :new
	 		expect(response).to render_template(nil)
		end	

	describe 'get edit' do

		it "should redirect_to root_path" do
			delete :destroy
			expect(response).to redirect_to(root_path)
		end
	end

	describe 'get show' do
	end

	describe 'patch update' do
	end

	describe 'delete destroy' do
	end
end
end
end