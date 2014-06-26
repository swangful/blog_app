require 'spec_helper'

describe SessionsController do
	describe 'get new' do
		it "should get successfully" do
			get :new
			expect(response).to be_success
		end
# A little confused on here
		it "should render_template 'new'" do
			get :new
	 		expect(response).to render_template('new')
		end
	end

	describe 'post create' do
		let :user do
			User.create({email: 'foobar@foobar.com', name: "Ray Chen", password: 'password'}) 
		end

		it "should find user and assign session[:user] to that user_id" do
			post :create, session: {email: user.email}
			expect(session[:user]).to eql(user.id)
		end

		it "given no found user, it should redirect to new with an error message" do
			post :create, session: {email: 'asdf'}
			expect(response).to redirect_to(signup_path)
			expect(flash[:error]).to_not be_blank
		end
	end

	describe 'delete destroy' do 
		it "should nil out session[:user]" do
			session[:user] = 123
			delete :destroy
			expect(session[:user]).to be_nil
		end

		it "should redirect_to root_path" do
			delete :destroy
			expect(response).to redirect_to(root_path)
		end
	end
end
