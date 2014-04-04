class WarsController < ApplicationController

  def create
    @war = War.new(war_params)
    if @war.save
      render 'wars/show.rabl', :status => 201
    else
      render 'errors/show.rabl', :status => 422
    end
  end

  private

  def war_params
    params.require(:war).permit(:name, :has_end, :ending_date, :ending_score, :prize, :is_private, :open_registration, :is_disabled)
  end

end
