require 'spec_helper'

describe "Welcome Routing" do
  it "should route new successfully" do
    { get: root_path }.should route_to(:controller => 'welcome', :action => 'index')
  end 
end