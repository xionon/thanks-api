unless Rails.env.production?
  key = ApiKey.generate!
  User.create(
    :email => 'alechipshear@gmail.com',
    :password => "password",
    :password_confirmation => "password",
    :api_keys => [key]
  )


  20.times { |i| Message.create(:recipient => "User #{i}", :body => "Thanks for ##{i}") }
end
