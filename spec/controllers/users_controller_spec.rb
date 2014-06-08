require 'spec_helper'

describe UsersController do
	let :user do 
		User.create({email: 'foobar@foobar.com', name: "Ray Chen"}) 
	end

	let :user2 do
		User.create({email: 'swangful@gmail.com', name: "Steve"})
	end

	describe 'get new' do
		it "should get successfully" do
			get :new
			expect(response).to be_success
		end

		it "should have a new @user" do
			get :new
			assigns(:user) # @user in the controller
			expect(assigns(:user)).to be_new_record # new_record?
			# @user.new_record? => true
			# @user.new_record? => false
			# expect(assigns(:user)).to_not be_new_record
		end
	end
# this test is failling but not when its ran in debugger? 
# the test is not creating a user..i think.
	describe "post create" do
		it "should create successfully" do
			post :create, {user: {name: "Steve", email: 'swang@gmail.com'}}
			# brand=ASUT&bmod=ASUT
			# {brand: 'ASUT', mod: "ASUT"} 
			# User.new({email: 'swang@swang.com', name: "Steve Wang"})
			expect(response).to be_success
		end

		it "creates a new user" do
			expect do
				post :create, {user: {name: "Steve",email: 'swang@gmail.com'}}
				new_count = User.count
				User.new({email: 'foobar@foobar.com', name: "Ray Chen"}) 
			end.to change{User.count}.by(1)
		end
	end
#failling because i dont know what im doing...
	describe "put update" do
		context 'on failure' do
			# fails because of your use validation
			it "should render template edit" do
			patch :update, {id: user.id}
			response.should render_template('edit')
		end
	end

		context 'on success' do
			it "should redirect to that user"
		end
	end
#have not finished yet
	describe "delete destroy" do
		it "should delete a user" do
		expect do
				delete :destroy
				new_count = User.count
				User.new({email: 'foobar@foobar.com', name: "Ray Chen"}) 
			end.to change{User.count}.by(1)
		end
		# look at create a user by expecting a change count of -1
		# look at the routes, to figure out what VERB /get/post/put/delete?
		# action
		# what parameters?
	end

	describe "get index" do
		it "should get index" do
			get :index
			expect(response).to be_success
		end
		
		it "should render template index" do
		    get :index
			response.should render_template(:index)
		end
#Failling becuase i need to locate the array the user is in?
		it "@users should include user" do
		 debugger
			user
			get :index
			#need to find the array the user is located in. should include(user)

			# a = ["v","t"]
			# a.should include("v") 
			# how to access controller's @user = assigns(:user)
			# http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-include-3F
			# how to write include? in an spec
			expect(assigns(:user)).to include(user)
		end
#failing because same as above
		it "@user should be kind of Array" do
			# how to access controller's @user
			# http://ruby-doc.org/core-2.1.1/Object.html#method-i-kind_of-3F
			# how to write kind_of? in an spec
		end
	end

	describe "get search" do
#Failing here, pending test since I do not have a search function
		it "with search parameter" do
			pending "no search yet"
				# /users?search=Ray+Chen
			get :index, {search: "Ray+Chen"}
		end

		# You should test that users is an Array instance
		it "should have @users as an array" do
			pending
			user
			get :index
			assigns(:users) # @users
		end
#Passing, but not sure why? I just copy and pasted.
		# you should test here that user is in @users
		it "should have user in @users" do
			pending
			get :index, {id: user}
			expect(:user).to eql(:user)
		end

		it "should render template 'index'" do
			pending
			get :index
			response.should render_template(:index)
		end
	end

	describe "get show" do
		it "should get successfully" do
			get :show, {id: user.id}
			expect(response).to be_success
		end

		it "should have user as @user" do
			get :show, {id: user.id}
			# we want to very @user is equal to user
			# assigns(:user) == @user
			expect(user).to eql(assigns(:user)) 
			# expect('foo').to eql('foo')
		end

		it "should render template 'show'" do
			get :show, {id: user.id}

			response.should render_template('show')
		end
	end

	describe "get edit" do
		it "should get successfully" do
			get :edit, {id: user.id}
			expect(response).to be_success
		end


		it "should render template 'edit" do
			get :edit, {id: user.id}
			response.should render_template('edit')
		end


		it "should edit @user" do
			get :edit, {id: user.id}
			expect(assigns(:user)).to eql(user)
		end
	end
end



