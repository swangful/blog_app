require 'spec_helper'

describe "Posts Routing" do
  it "should route successfully" do
    expect({ get: posts_path }).to route_to(:controller => 'posts', :action => 'index')
  end 

  it "should show post successfully" do
  	expect({ get: post_path({id: 1}) }).to route_to(:controller => 'posts', :action => 'show', id: "1")
  end
end