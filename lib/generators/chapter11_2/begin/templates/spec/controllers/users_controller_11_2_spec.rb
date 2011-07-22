require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
      @mp1 = Factory(:micropost, :user => @user, :content => "Foo bar", :created_at => 1.day.ago)
      @mp2 = Factory(:micropost, :user => @user, :content => "Baz quux",:created_at => 2.days.ago)
    end

    it 'should populate the @microposts instance variable' do
      get :show, :id => @user.id
      # Note: in a controller test, we can access instance variables
      # of the controller by using the assigns[] function
      assigns[:microposts].should == [@mp1,@mp2]
    end

    describe "HTML output" do
      render_views

      it "should show the user's microposts" do
        get :show, :id => @user.id
        response.should have_selector("span.content", :content => @mp1.content)
        response.should have_selector("span.content", :content => @mp2.content)
      end
    end
  end

end
