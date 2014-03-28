Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies(:password,:authentication_token)
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |user|
  User.find(id)
end

Warden::Strategies.add(:password) do
  def authenticate!
    user = User.find_by_email(params['email']) || User.find_by_authentication_token(params['authentication_token'])
    if user && user.authenticate(params['password'])
      success! user
    else
      fail "Invalid email or password"
    end
  end
end
