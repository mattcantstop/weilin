class UsersController < ApplicationController

  before_action :find_user, only: [:show, :update, :destroy]
  skip_before_filter :check_token, only: :create
  attr_accessor :password, :password_confirmation

  def create
    @user = User.new(user_params)
    @user.password_confirmation = @user.password
    if @user.save
      render 'show.rabl', status: 201
    else
      puts @user.errors.full_messages
      render 'errors/show.rabl'
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
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :token, :is_disabled)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
