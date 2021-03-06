class UsersController < ApplicationController
  
  def new; end

  def create
    @user = User.new user_params

    if @user.save
      login! @user
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :username, :first_name, :last_name, :password, :location, :description, :email, :avatar_url
  end
end
