20.times do |n|
name = Faker::LordOfTheRings.character
email = Faker::Internet.email
password = Faker::Internet.password
uid = SecureRandom.uuid
User.create(
name: name,
email: email,
password: password,
uid: uid
)
end
