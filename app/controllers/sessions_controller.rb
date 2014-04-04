class SessionsController < ApplicationController

  def create
    warden = request.env['warden']
    user = warden.authenticate
    if user
      render 'users/show.rabl', status: 201
    end
  end


end
