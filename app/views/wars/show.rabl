object @war
attributes :name, :has_end, :ending_date, :ending_score, :prize, :is_private, :open_registration, :is_disabled, :is_complete, :owner_id, :winner_id
if @participants
  extends "participants/index.rabl"
end
