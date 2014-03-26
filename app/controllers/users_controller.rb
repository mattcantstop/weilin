class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render 'show.rabl', status: 201
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :authentication_token, :is_disabled)
  end

end
