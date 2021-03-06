require 'faker'
require "open-uri"

User.destroy_all

users = 50
random_id = rand(1..99)
counter = 0

puts "Creating #{users} users..."

users.times do
  counter += 1
  user = User.new(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "123456"
    )

  file = URI.open(Faker::Avatar.image)
  user.photo.attach(io: file, filename: "#{user.name}.jpg", content_type: 'image/jpg')

  user.save!

  puts "#{counter} #{counter == 1 ? 'user' : 'users'} created..."
end

puts 'Finished 🎉'
