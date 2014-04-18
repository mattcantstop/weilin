participants = []
@participants.map do |participant|
  user = User.find(participant.user_id)
  participants << user
end
child participants => :participants do |participant|
  attribute :first_name, :last_name, :username
end
