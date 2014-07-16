class BattlesController < ApplicationController

  before_action :set_war, only: [:index, :create]

  def index
    @battles = @war.battles
  end

  def create
    @battle = @war.battles.build(battle_params)
    if @battle.save
      render 'wars/show.rabl', status: 201
    else
      puts @battle.errors.full_messages
      render 'errors/show.rabl'
    end
  end

  private

  def set_war
    @war = War.find(params[:war_id])
  end

  def battle_params
    params.require(:battle).permit(:war_id, :winner_id, :user_id, :notes)
  end

end
