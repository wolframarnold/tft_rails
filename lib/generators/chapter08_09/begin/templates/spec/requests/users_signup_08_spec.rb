require 'spec_helper'

describe "Users" do

  describe "signup" do

    describe "success" do

      it "should make a new user" do
        expect {
          visit signup_path
          fill_in "Name",         :with => "Example User"
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          response.should render_template('users/show')
        }.to change(User, :count).by(1)
      end

      it "should print a welcome message" do
        visit signup_path
        fill_in "Name",         :with => "Example User"
        fill_in "Email",        :with => "user@example.com"
        fill_in "Password",     :with => "foobar"
        fill_in "Confirmation", :with => "foobar"
        click_button
        response.should have_selector("div.flash.notice",
                                      :content => "Welcome! You have signed up successfully.")
      end

    end


  end
end
