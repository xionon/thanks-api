class ApiKey < ActiveRecord::Base
  validates_uniqueness_of :token

  def self.generate!
    new.tap do |api_key|
      begin
        api_key.token = SecureRandom.urlsafe_base64
        puts api_key.token
      end while( !api_key.save )
    end
  end
end
