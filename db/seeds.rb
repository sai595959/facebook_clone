10.times do |n|
  name = Faker::LordOfTheRings.character
  email = Faker::Internet.email
  password = Faker::Internet.password
  uid = SecureRandom.uuid
  User.create!(
              id: n,
              name: name,
              email: email,
               password: password,
               password_confirmation: password,
               uid: uid
               )
end
