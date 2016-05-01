# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# link seed data

link1 = Link.create!(url:'https://www.youtube.com/watch?v=TnXXR7IOYiI&feature=youtu.be',title:'Ruby on Rails tutorial',description:'This is a very useful tutorial for creating model class',level:1)
link1.created_at = (rand*10).days.ago
link1.save!
link2 = Link.create!(url:'https://en.wikipedia.org/wiki/Theory_of_computation',title:'Theory of computation',description:'This link gives information about TOC',level:1)
link2.created_at = (rand*10).days.ago
link2.save!
link3 = Link.create!(url:'http://lsa.colorado.edu/papers/dp1.LSAintro.pdf',title:'Latent semantic analysis',description:'It addresses the concept of LSA in detail',level:1)
link3.created_at = (rand*10).days.ago
link3.save!
link4 = Link.create!(url:'http://bluebrain.epfl.ch/',title:'Blue Brain Demo',description:'This is a project by IBM',level:1)
link4.created_at = (rand*10).days.ago
link4.save!
link5 = Link.create!(url:'http://guides.rubyonrails.org/',title:'Learn Ruby in 5 days',description:'A tutorial which can teach you ruby in 5 days',level:1)
link5.created_at = (rand*10).days.ago
link5.save!

link6 = Link.create!(url:'https://www.railstutorial.org/',title:'Learn Rails in 3 days Demo',description:'A tutorial which can teach you ruby in 5 days',level:1)
link6.created_at = (rand*10).days.ago
link6.save!
link7 = Link.create!(url:'https://www.railstutorial.org/book',title:'Rails Book',description:'A tutorial which can teach you ruby in 5 days',level:1)
link7.created_at = (rand*10).days.ago
link7.save!
link8 = Link.create!(url:'https://www.railstutorial.org/book/toy_app',title:'Rails Book Chapter 2',description:'A tutorial which can teach you ruby in 5 days',level:2)
link8.created_at = (rand*10).days.ago
link8.save!



# rating seed data

rate1 = Rating.create!(value: 1)
rate2 = Rating.create!(value: 1)
rate3 = Rating.create!(value: 1)
rate4 = Rating.create!(value: -1)
rate5 = Rating.create!(value: 1)
rate6 = Rating.create!(value: -1)

# account seed data
account1 = Account.create!(email: "test1@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account2 = Account.create!(email: "test2@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account3 = Account.create!(email: "test3@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account4 = Account.create!(email: "test4@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account5 = Account.create!(email: "admin@memphis.edu", password: "12345678", sign_in_count: 10, level: 1)
account6 = Account.create!(email: "lwang3@memphis.edu", password: "22222222", sign_in_count: 0, level: 1)
account_lp_1 = Account.create!(email: "test_user_lp_1@memphis.edu", password: "test_user_lp_12345", sign_in_count: 10, level: 0)
account_lp_2 = Account.create!(email: "test_user_lp_2@memphis.edu", password: "test_user_lp_12345", sign_in_count: 10, level: 0)
account_lp_3 = Account.create!(email: "test_user_lp_3@memphis.edu", password: "test_user_lp_12345", sign_in_count: 10, level: 0)

# Followship seed data

followship1 = Followship.create!(follower_id: 2, following_id: 4)
followship2 = Followship.create!(follower_id: 3, following_id: 1)
followship3 = Followship.create!(follower_id: 4, following_id: 2)
foolowship4 = Followship.create!(follower_id: 1, following_id: 3)

# link-rate seed data

link1.ratings << rate1 << rate2 << rate3
link2.ratings << rate4 << rate5
link3.ratings << rate6

# followship seed data

# account1.followships << account2 << account3
account_lp_2.followers = [account_lp_3]
account_lp_2.save!

# Account-link seed data

account1.links << link1
account2.links << link2
account3.links << link3
account4.links << link4
account_lp_2.links = [link6, link7, link8]
account_lp_2.save!

# account-rate seed data

account1.ratings << rate1 << rate4 << rate6
account2.ratings << rate2 << rate5
account3.ratings << rate3

account1.save!
account2.save!
account3.save!
account4.save!

# comments seed data

comment1 = Comment.create!(comment: "This is a helpful link! Thanks a lot.")
comment2 = Comment.create!(comment: "How is the textbook? Is it easy to understand?")

account6.comments << comment1 << comment2

link1.comments << comment1
link2.comments << comment2


# create profile seeds
profile_account1 = Profile.create!(first_name: "test1_first", last_name: "test1_last")
profile_account2 =  Profile.create!(first_name: "test2_first", last_name: "test2_last")
profile_account3 = Profile.create!(first_name: "test3_first", last_name: "test3_last")

account1.profile = profile_account1
account2.profile = profile_account2
account3.profile = profile_account3

account1.save!
account2.save!
account3.save!
