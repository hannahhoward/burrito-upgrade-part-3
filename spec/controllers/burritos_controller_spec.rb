require 'spec_helper'

describe BurritosController do
  let! :burrito do
    Burrito.create(:name => "Awesome")
  end

  let :burrito_params do
  {
    :name => "great burrito"
  }
  end

  describe "without authentiation" do
    describe "GET index" do
      it "should redirect to sign in" do
        get :index
        response.should redirect_to(new_sessions_path)
      end
    end

    describe "GET show" do
      it "should redirect to sign in" do
        get :show, :id => burrito.id
        response.should redirect_to(new_sessions_path)
      end
    end

    describe "GET new" do
      it "should redirect to sign in" do
        get :new
        response.should redirect_to(new_sessions_path)
      end
    end

    describe "GET edit" do
      it "should redirect to sign in" do
        get :edit, :id => burrito.id
        response.should redirect_to(new_sessions_path)
      end
    end

    describe "POST create" do
      it "should redirect to sign in" do
        post :create, :burrito => burrito_params
        response.should redirect_to(new_sessions_path)
      end
    end

    describe "PUT update" do
      it "should redirect to sign in" do
        post :create, :id => burrito.id, :burrito => burrito_params
        response.should redirect_to(new_sessions_path)
      end
    end
  end
end
