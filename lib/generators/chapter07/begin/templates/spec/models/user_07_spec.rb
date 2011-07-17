require 'spec_helper'

describe User do

  it "has a name method" do
    # Note: Ruby has a way to ask a class if it has a certain method defined,
    # like User.respond_to?(:name) returns true or false depending on whether the
    # class has a method called "name" defined on it
    # RSpec's way of asserting this is with "should respond_to(:method_name)"

    # Question: How does ActiveRecord know there is a name method? There is no such
    # method explicitly defined in the class (user.rb)
    User.should respond_to(:name)
  end

  it "can set and read back name" do
    u = User.new
    u.name = 'Joe Smith'
    u.name.should == 'Joe Smith'
  end

  it "requires a name" do
    no_name_user = User.new  # Note: no attributes set at all, i.e. name is nil
    # Note: the errors array on a model object is populated when valid? is called
    # RSpec's be_valid is a fancy way of saying valid?.should == true
    # This will call valid, and populate the error array, so we can check
    # what failure occurred
    no_name_user.should_not be_valid
    no_name_user.errors[:name].should == ["can't be blank"]
  end

  it "rejects names that are too long" do
    long_name_user = User.new(:name => 'a' * 51)
    long_name_user.should_not be_valid
    long_name_user.errors[:name].should == ["is too long (maximum is 50 characters)"]
  end

end
