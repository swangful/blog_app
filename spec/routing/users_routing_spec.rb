require 'spec_helper'

describe "Users Routing" do
  it "should route successfully" do
    { get: users_path }.should route_to(:controller => 'users', :action => 'index')
  end 

  it "should route to new user successfully" do
  	{ get: new_user_path }.should route_to(:controller => 'users', :action => 'new')
  end

  it "should route to creating a new user successfully" do
  	{ post: users_path }.should route_to(:controller => 'users', :action => 'create')
  end

  it "should route to edit user successfully" do
  	{ get: edit_user_path({id: 1}) }.should route_to(:controller => 'users', :action => 'edit', id: "1")
  end

  it "should show user successfully" do
  	{ get: user_path({id: 1}) }.should route_to(:controller => 'users', :action => 'show', id: "1")
  end

  it "should route to update user successfully" do
  	{ patch: user_path({id: 1}) }.should route_to(:controller => 'users', :action => 'update', id: "1")
  end

  it "should route to destroy user successfully" do
  	{ delete: user_path({id: 1}) }.should route_to(:controller => 'users', :action => 'destroy', id: "1")
  end

  it "should route to sign up successfully" do
    { get: signup_path }.should route_to(:controller => 'users', :action => 'new')
  end 
end