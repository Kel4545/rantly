# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(
  username: "Bacon Bob",
  firstname: "Bacon",
  lastname: "Bob",
  password: 'password',
  password_confirmation: 'password',
  id: 3,
  url: "http://addyosmani.com/blog/wp-content/uploads/2013/04/unicorn.jpg"
)

User.create!(
  username: "Kelly",
  firstname: "Kelly",
  lastname: "Pederson",
  password: 'password',
  password_confirmation: 'password',
  id: 4
)

Rant.create!(
  rant: "I am a delicious Bacon Bob! I love to eat Bacon, Bacon and more Bacon. Bacon Bacon Bacon Bacon Bacon Bacon Bacon Bacon Bacon Bacon Bacon Bacon",
  about: "Breakfast sandwich",
  user_id: 3
)

Rant.create!(
  rant: "Unicorn planet",
  about: "heeeeeeeeeeey",
  user_id: 4
)