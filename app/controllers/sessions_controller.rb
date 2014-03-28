class SessionsController < ApplicationController

  def create
    user = env['warden'].authenticate
    if user
      render 'users/show.rabl', status: 201
    end
  end


end
