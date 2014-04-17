class WarsController < ApplicationController

  before_action :select_war, only: [:show, :update, :delete, :join, :show_with_participants_and_battles]

  def show
    render 'show.rabl'
  end

  def create
    @war = War.new(war_params)
    @war.owner_id = params[:user_id]
    if @war.save
      render 'wars/show.rabl', :status => 201
    else
      render 'errors/show.rabl', :status => 422
    end
  end

  def join
    @war.participants.create(:war_id => @war.id, :user_id => params[:user_id])
    render 'show.rabl', :status => 201
  end

  def show_with_participants_and_battles
    @participants = @war.participants
    @battles = @war.battles
    render 'show.rabl'
  end

  private

  def war_params
    params.require(:war).permit(:name, :has_end, :ending_date, :ending_score, :prize, :is_private, :open_registration, :is_disabled)
  end

  def select_war
    @war = War.find(params[:id])
  end

end
