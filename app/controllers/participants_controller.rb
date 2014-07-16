class ParticipantsController < ApplicationController

  before_action :set_war

  def index
    @participants = @war.participants
  end

  private

  def set_war
    @war = War.find(params[:war_id])
  end

end
