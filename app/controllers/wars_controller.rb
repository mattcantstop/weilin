class WarsController < ApplicationController

  before_action :select_war, only: [:show, :update, :delete, :join, :show_with_participants_and_battles]

  def show
    render 'show.rabl'
  end

  def create
    @war = War.new(war_params)
    @war.ending_date = sanitize_date(params['war']['ending_date'])
    @war.owner_id = params[:user_id]
    if @war.save
      @war.participants.create(:war_id => @war.id, :user_id => params[:user_id])
      render 'wars/show.rabl', :status => 201
    else
      render 'errors/show.rabl', :status => 422, :war => @war
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

  def index
    @wars = War.all
    render 'index.rabl'
  end

  def update
    @war = War.find(params[:id])
    if @war.save
      render 'show.rabl'
    end
  end

  private

  def war_params
    params.require(:war).permit(:name, :has_end, :ending_date, :ending_score, :prize, :is_private, :open_registration, :is_disabled)
  end

  def select_war
    @war = War.find(params[:id])
  end

  def sanitize_date(integer_date)
    datetime = Time.at(integer_date).utc.to_datetime
    return datetime
  end

end
