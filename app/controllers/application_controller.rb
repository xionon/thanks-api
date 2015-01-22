class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    warden.user
  end
  helper_method :current_user

  def warden
    request.env['warden']
  end

  def authenticate_user
    warden.authenticate!
  end
end
