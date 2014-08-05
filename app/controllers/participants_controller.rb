class ParticipantsController < ApplicationController

  before_action :set_war

  def index
    @participants = @war.participants
  end

  def create
    @participant = @war.participants.build(war_id: @war.id, user_id: params[:participant][:user_id])
    if @participant.save
      render 'wars/show.rabl', status: 201
    else
      render 'errors.show.rabl', status: 414
    end
  end

  private

  def set_war
    @war = War.find(params[:war_id])
  end

end
