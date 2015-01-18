class ApiKey < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :token

  def self.generate!
    new.tap do |api_key|
      begin
        api_key.token = SecureRandom.urlsafe_base64
      end while( !api_key.save )
    end
  end
end
