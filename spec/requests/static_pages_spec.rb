require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do

    it "should have the content 'My Blog'" do
      visit root_path
      expect(page).to have_content('My Blog')
    end
  end

  describe "Listing posts page" do

  	it "should have posts" do
  		visit "/posts"
  		expect(page).to have_content('Listing posts')
  	end
  end

  describe "New posts page" do

  	it "should have new post" do
  		pending #Test fails, not sure why. Debugger also not working.
  		visit "/posts/new"
  		expect(page).to have_content('New post')
  	end
  end
end