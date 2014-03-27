class UsersController < ApplicationController

  before_action :find_user, only: [:show, :update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      render 'show.rabl', status: 201
    end
  end

  def show
    render 'show.rabl'
  end

  def update
    if @user.update_attributes(user_params)
      render 'show.rabl'
    else
      render 'errors.rabl'
    end
  end

  def destroy
    @user.is_disabled = true
    if @user.save
      head :no_content
    else
      render_errors(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :authentication_token, :is_disabled)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
