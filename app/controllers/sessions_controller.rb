class SessionsController < ApplicationController

  def create
    warden = env['warden']
    binding.pry
    user = env['warden'].authenticate
    if user
      render 'users/show.rabl', status: 201
    end
  end


end
