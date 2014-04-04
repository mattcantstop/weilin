class WarsController < ApplicationController

  def create
    @war = War.new(war_params)
    if @war.save
      render 'wars/show.rabl'
    end
  end

end
