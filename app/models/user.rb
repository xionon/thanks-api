class User < ActiveRecord::Base
  has_secure_password
  has_many :api_keys, :dependent => :destroy

  scope :by_email_and_token, ->(email, token) {
    includes(:api_keys).where(:email => email, :api_keys => {:token => token})
  }
end
