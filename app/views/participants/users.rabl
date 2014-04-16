child :participants do |participant|
  user = User.find(participant.user_id)
  child(user) { attributes :first_name, :last_name, :username }
end
