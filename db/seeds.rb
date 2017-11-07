# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(name: :admin)
Role.create(name: :dev)
Role.create(name: :client)

user0 = User.create(alias: 'Admin_Auxfil',
                    name: 'Filip Maslovaric',
                    email: 'filip.maslovaric@gmail.com',
                    password: 'develooadmin',
                    password_confirmation: 'develooadmin')
user0.add_role(:admin)

user1 = User.create(name: 'Milip Faslovaric',
                    alias: 'Exaemo',
								    email: 'exaemo@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user1.add_role(:dev)

user2 = User.create(alias: 'Joe Develops',
                    name: 'Joe Bloggs',
								    email: 'dev@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user2.add_role(:dev)

user3 = User.create(alias: 'GoofyGoobah',
                    name: 'Spongebob Squarepants',
								    email: 'client@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user3.add_role(:client)

user4 = User.create(alias: 'Alias',
                    name: 'Patrick Star',
								    email: 'client1@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user4.add_role(:client)

1.upto(5) do |i|
	Commission.create(title: "App #{i}",
                    description: 'An App',
								    price: 60 * i,
								    user: user1)
end
1.upto(5) do |i|
	Commission.create(title: "Website #{i}",
                     description: 'A Website',
								     price: 20 * i,
								     user: user2)
end

1.upto(2) do |i|
  Commission.create(title: "Hidden Item #{i}",
                    description: "You can't see me",
                    price: 10 * i,
                    user: user0,
                    hidden: true)
end

puts '!Database Seeded!'
