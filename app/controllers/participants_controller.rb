class ParticipantsController < ApplicationController

  before_action :set_war, only: [:index]

  def index

  end

  private

  def set_war
    @war = War.find(params[:war_id])
  end

end
