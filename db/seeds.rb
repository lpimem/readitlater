# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

link1 = Link.create!(url:'https://www.youtube.com/watch?v=TnXXR7IOYiI&feature=youtu.be',title:'Ruby on Rails tutorial',description:'This is a very useful tutorial for creating model class',level:2)
link2 = Link.create!(url:'https://en.wikipedia.org/wiki/Theory_of_computation',title:'Theory of computation',description:'This link gives information about TOC',level:2)
link3 = Link.create!(url:'http://lsa.colorado.edu/papers/dp1.LSAintro.pdf',title:'Latent semantic analysis',description:'It addresses the concept of LSA in detail',level:2)
link4 = Link.create!(url:'http://bluebrain.epfl.ch/',title:'Blue Brain',description:'This is a project by IBM',level:2)


account1 = Account.create!(
  username: "test_user_lp_1",
  password: "test_user_lp_12345",
  level: 1
)

account2 = Account.create!(
  username: "test_user_lp_2",
  password: "test_user_lp_12345",
  level: 1
)

account3 = Account.create!(
  username: "test_user_lp_3",
  password: "test_user_lp_12345",
  level: 1
)

account4 =  Account.create!(
	username: "Peter",
	password: "1234",
	level: 2
)


#rating seed data

rate1 = Rating.create!(value: 20)
rate2 = Rating.create!(value: 10)
rate3 = Rating.create!(value: 25)
rate4 = Rating.create!(value: 40)
rate5 = Rating.create!(value: 1)
rate6 = Rating.create!(value: -3)

# account1.followship<<acount2<<account3
# account2.followship<<acount3<<account4
# account3.followship<<aoount4<<account1
