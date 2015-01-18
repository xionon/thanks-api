unless Rails.env.production?
  User.create(
    :email => 'alechipshear@gmail.com',
    :password => "password",
    :password_confirmation => "password"
  )
end
