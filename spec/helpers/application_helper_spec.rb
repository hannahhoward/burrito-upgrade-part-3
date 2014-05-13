require 'spec_helper'

describe ApplicationHelper do
  let! :user do
    User.create(:name => "Hannah",
      :email => "hannah@hannah.com",
      :password => "cheese")
  end

  describe "current_user" do
    describe "with current_user instance variable set already" do
      it "should return current user instance variable" do
        assign(:current_user, user)
        expect(helper.current_user).to eql(user)
      end
    end

    describe "with session variable set" do
      it "should return the user stored in the session" do
        session[:remember_token] = user.id
        expect(helper.current_user).to eql(user)
      end
    end

    describe "with no current_user instance variable or user stored in the session" do
      it "should return nil" do
        expect(helper.current_user).to be_nil
      end
    end

  end

end
