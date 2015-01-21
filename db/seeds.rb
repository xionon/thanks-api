unless Rails.env.production?
  User.create(
    :email => 'alechipshear@gmail.com',
    :password => "password",
    :password_confirmation => "password"
  )

  20.times { |i| Message.create(:recipient => "User #{i}", :body => "Thanks for ##{i}") }
end
