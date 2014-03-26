class UsersController < ApplicationController

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      render 'show.rabl'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :authentication_token, :is_disabled)
  end

end
