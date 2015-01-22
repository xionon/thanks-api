Rails.application.config.middleware.use Warden::Manager do |config|
  config.default_strategies :password, :token
  config.failure_app = SessionsController.action(:new)
end

Warden::Manager.serialize_into_session do |user|
  puts user.inspect
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end

Warden::Strategies.add(:password) do
  def valid?
    params['email'] && params['password']
  end

  def authenticate!
    user = User.find_by_email(params['email'])
    if user && user.authenticate(params['password'])
      success! user
    else
      fail "Invalid email or password"
    end
  end
end

Warden::Strategies.add(:token) do
  def valid?
    params['email'] && params['token']
  end

  def authenticate!
    user = User.by_email_and_token(params['email'], params['token']).first

    if user
      success! user
    else
      fail "Invalid email or token"
    end
  end
end
