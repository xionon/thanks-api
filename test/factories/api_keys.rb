FactoryGirl.define do
  factory :api_key do
    token SecureRandom.hex
  end

end
