require 'spec_helper'

describe "Sessions Routing" do
	it "should route successfully" do
		{ post: sessions_path }.should route_to(:controller => 'sessions', :action => 'create')
	end

	it "should route to sign up successfully" do
		{ get: signup_path }.should route_to(:controller => 'users', :action => 'new')
	end

  	it "should route to login successfully" do
    	{ get: new_session_path }.should route_to(:controller => 'sessions', :action => 'new')
  	end 

 	 it "should route to logout successfully" do
  		{ delete: session_path({id: 1}) }.should route_to(:controller => 'sessions', :action => 'destroy', id: "1")
 	end
end