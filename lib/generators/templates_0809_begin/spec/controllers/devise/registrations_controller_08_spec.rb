require 'spec_helper'

describe Devise::RegistrationsController do
  render_views

  before do
    # The following request parameter is necessary for testing, according to:
    # https://github.com/plataformatec/devise/wiki/How-To:-Controllers-and-Views-tests-with-Rails-3-(and-rspec)
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have h1 tag with Sign up" do
      get :new
      response.should have_selector("h1", :content => "Sign up")
    end

    %w(name email password password_confirmation).each do |attr|
      it "should have a #{attr} field" do
        get :new
        response.should have_selector("input[name='user[#{attr}]']")
      end
    end
  end


  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :name => "", :email => "", :password => "",
                  :password_confirmation => "" }
      end

      it "should not create a user" do
        expect {
          post :create, :user => @attr
        }.to_not change(User, :count)
      end

      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end

      it "should show errors" do
        post :create, :user => @attr
        response.should have_selector("div#error_explanation")
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar" }
      end

      it "should create a user" do
        expect {
          post :create, :user => @attr
        }.to change(User, :count).by(1)
      end

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end

      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:notice].should == "Welcome! You have signed up successfully."
      end
    end
  end
end
