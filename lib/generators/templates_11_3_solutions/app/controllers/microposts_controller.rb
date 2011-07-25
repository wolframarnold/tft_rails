class MicropostsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

 def destroy
   # .try will call the method given, unless the caller is nil
   current_user.microposts.find_by_id(params[:id]).try(:destroy)
   redirect_to :back
 end

end
