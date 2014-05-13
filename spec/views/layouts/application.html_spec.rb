require 'spec_helper'

describe 'layouts/application' do

  let! :user do
    User.create(:name => "Hannah",
      :email => "hannah@hannah.com",
      :password => "cheese")
  end

  describe 'signed-in user' do

    before do
      assign(:current_user, user)
    end

    it "should show the users name" do
      render
      expect(rendered).to match /Hello, Hannah/
    end

    it "should show a sign out link" do
      render
      expect(rendered).to match /Sign Out/
    end

  end

  describe 'signed-out user' do
    before do
      assign(:current_user, nil)
    end

    it "should show a sign in link" do
      render
      expect(rendered).to match /Sign In/
    end

    it "should show a sign up link" do
      render
      expect(rendered).to match /Sign Up/
    end
  end


end