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
                    password: 'tajnalozinka',
                    password_confirmation: 'tajnalozinka')
user0.add_role(:admin)

user1 = User.create(alias: 'BizzarroFil',
                    name: 'Milip Faslovaric',
								    email: 'dev@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user1.add_role(:dev)

user2 = User.create(alias: 'Dev Joe',
                    name: 'Joe Bloggs',
								    email: 'dev1@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user2.add_role(:dev)

user3 = User.create(alias: 'Dev Schmoe',
                    name: 'Schmoe Bloggs',
								    email: 'dev2@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user3.add_role(:dev)

user4 = User.create(alias: 'GoofyGoobah',
                    name: 'Spongebob Squarepants',
								    email: 'dev3@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user4.add_role(:dev)

user5 = User.create(alias: 'CodeSquid',
                    name: 'Squidward',
								    email: 'dev4@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user5.add_role(:client)

user6 = User.create(alias: 'Alias',
                    name: 'Patrick Star',
								    email: 'client1@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user6.add_role(:client)

user7 = User.create(alias: 'DeepSpaceDiver',
                    name: 'Sandy Cheeks',
								    email: 'client2@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user7.add_role(:client)

Commission.create!(title: "App",
                  description: 'An App',
							    price: 60,
							    user: user1)

Commission.create!(title: "Website",
                   description: 'A Website',
							     price: 20,
							     user: user2)

Commission.create!(title: "Website",
                  description: 'A Website',
						      price: 40,
						      user: user3)

Commission.create!(title: "Website",
                  description: 'A Website',
                  price: 30,
                  user: user4)

Commission.create!(title: "Hidden Item",
                  description: "You can't see me",
                  price: 10,
                  user: user0,
                  hidden: true)

AdminUser.create!(email: 'admin@develoo.co', password: 'supertajnalozinka', password_confirmation: 'supertajnalozinka') if Rails.env.development?

puts '!Database Seeded!'
