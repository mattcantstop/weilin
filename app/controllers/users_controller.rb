class UsersController < ApplicationController

  before_filter :find_user, except: [:create, :authenticate]
  skip_before_filter :find_and_validate_user, only: [:authenticate, :create]
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

  def authenticate
    @user = User.find_by_email(params[:login]).try(:authenticate, params[:password])
    puts @user
    if !@user.nil?
      render 'show.rabl', status: 200
    else
      raise ActionController::RoutingError.new("Resource Not Found")
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

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :token, :is_disabled)
  end

end
