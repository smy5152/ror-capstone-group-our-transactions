class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "You logged in succesfully as #{@user.name}"
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Please Sign In or create a New User'
      redirect_to '/login'
    end
  end

  def login; end

  def destroy
    session.destroy
    flash[:notice] = 'You logged out successfully '
    redirect_to root_path
  end
end
