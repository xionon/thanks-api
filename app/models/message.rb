class Message < ActiveRecord::Base
  belongs_to :api_key
  has_one :user, through: :api_key
  validates :recipient, presence: true
end
