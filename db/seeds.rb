# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Link.create!(url:'https://www.youtube.com/watch?v=TnXXR7IOYiI&feature=youtu.be',title:'Ruby on Rails tutorial',description:'This is a very useful tutorial for creating model class',level:2)
Link.create!(url:'https://en.wikipedia.org/wiki/Theory_of_computation',title:'Theory of computation',description:'This link gives information about TOC',level:2)
Link.create!(url:'http://lsa.colorado.edu/papers/dp1.LSAintro.pdf',title:'Latent semantic analysis',description:'It addresses the concept of LSA in detail',level:2)
Link.create!(url:'http://bluebrain.epfl.ch/',title:'Blue Brain',description:'This is a project by IBM',level:2)


Account.create!(
  username: "test_user_lp_1",
  password: "test_user_lp_12345",
  level: 1
)

Account.create!(
  username: "test_user_lp_2",
  password: "test_user_lp_12345",
  level: 1
)

Account.create!(
  username: "test_user_lp_3",
  password: "test_user_lp_12345",
  level: 1
)

