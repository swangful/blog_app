require 'spec_helper'

describe WelcomeController do

	describe 'get index' do
		it "should get successfully" do
		get :index
		expect(response).to be_success
     end
  end
end

# Controller
# class ScholarshipController < ApplicationController
#   layout :nil

#   def new
#   	@scholarship = Scholarship.new
#     @og_image = 'http://www.spokeo.com/assets/sem/scholar/scholarship_image_og.jpg'
#   end

#   def create
#   	@scholarship = Scholarship.new(params[:scholarship])

#     respond_to do |format|
#       format.html do
#       	if @scholarship.save
#       	 redirect_to( new_scholarship_path(success: true) )
#       	else
#           render action: :new
#       	end
#       end
#     end
#   end
# end

# CONTROLLER
# require 'spec_helper'

# describe ScholarshipController do
#   render_views

#   describe 'get new' do
#     it "should get successfully" do
#       get :new
#       response.should be_success
#     end

#     it "should create a new @scholarship" do
#       get :new
#       assigns(:scholarship).should be_kind_of(Scholarship)
#     end
#   end

#   describe "POST #create" do
#     it "should redirect to new_scholarship path" do
#       Scholarship.should_receive(:new).and_return(stub({save: true}))
#       post :create, scholarship: {name: "Ray Chen", email: "foo@foo.com", school: "UCLA", file: "foo"}
#       response.should be_redirect
#     end

#     it "should render if fail" do
#       post :create, scholarship: {name: "Ray Chen"}
#       response.should be_success
#     end
#   end
# end

# ROUTER
# require 'spec_helper'

# describe "Scholarship Routing" do
#   it "should route new successfully" do
#     { get: '/spokeo-connections-scholarship' }.should route_to(:controller => 'scholarship', :action => 'new')
#   end

#   it "should create successfully" do
#     { post: '/spokeo-connections-scholarship' }.should route_to(:controller => 'scholarship', :action => 'create')
#   end
# end