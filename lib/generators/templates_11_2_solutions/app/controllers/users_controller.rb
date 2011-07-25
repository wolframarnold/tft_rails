class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [:index, :destroy]
  before_filter :admin_user,         :only => :destroy

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to users_path
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
