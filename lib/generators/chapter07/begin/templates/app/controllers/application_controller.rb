class ApplicationController < ActionController::Base
  protect_from_forgery

  # This tells Devise where to re-direct to after successful sign up or sign in
  def after_sign_in_path_for(user)
    user_path(user.id)
  end
end
