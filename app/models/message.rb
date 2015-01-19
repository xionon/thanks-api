class Message < ActiveRecord::Base
  belongs_to :api_key
  validates :recipient, presence: true
end
