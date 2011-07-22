require 'spec_helper'

describe PagesController do

  before do
    @user = Factory(:user)
    sign_in @user
  end

  it 'home page should instantiate a new micropost instance' do
    get :home
    assigns[:micropost].should_not be_nil
  end
end
