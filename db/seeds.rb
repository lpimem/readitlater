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
account1 = Account.create!(email: "test1@memphis.edu", password: "12345678", sign_in_count: 10, level: 1)
account2 = Account.create!(email: "test2@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account3 = Account.create!(email: "test3@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account4 = Account.create!(email: "test4@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account5 = Account.create!(email: "admin@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)
account6 = Account.create!(email: "lwang3@memphis.edu", password: "22222222", sign_in_count: 0, level: 0)
account_bob = Account.create!(email: "bob@memphis.edu", password: "test_user_12345", sign_in_count: 10, level: 0)
account_alice = Account.create!(email: "alice@memphis.edu", password: "test_user_12345", sign_in_count: 10, level: 0)
account_trudy = Account.create!(email: "trudy@memphis.edu", password: "test_user_12345", sign_in_count: 10, level: 0)

# Followship seed data

followship1 = Followship.create!(follower_id: 2, following_id: 4)
followship2 = Followship.create!(follower_id: 3, following_id: 1)
followship3 = Followship.create!(follower_id: 4, following_id: 2)
followship4 = Followship.create!(follower_id: 1, following_id: 3)

# link-rate seed data

link1.ratings << rate1 << rate2 << rate3
link2.ratings << rate4 << rate5
link3.ratings << rate6

# followship seed data
5
# account1.followships << account2 << account3
account_alice.followers = [account_trudy]
account_alice.save!

# Account-link seed data (work)

account1.links << link1
account2.links << link2
account3.links << link3
account4.links << link4
account_alice.links = [link6, link7, link8]
account_alice.save!

# account-rate seed data

account1.ratings << rate1 << rate4 << rate6
account2.ratings << rate2 << rate5
account3.ratings << rate3



# report seed data
report1=Report.create!(reason: 'This is a spam link')
report2=Report.create!(reason: 'This is a bad link')
report3=Report.create!(reason: 'This is a spam link')
report4=Report.create!(reason: 'This link is dumb')
report5=Report.create!(reason: 'This link is bad link')
report6=Report.create!(reason: 'Refer this link if you were a beginner')
report7=Report.create!(reason: 'This link is dumb')
report8=Report.create!(reason: 'This link is a good link for beginners')

link1.reports<<report1
link2.reports<<report2
link3.reports<<report3
link4.reports<<report4

account1.reports<<report1
account2.reports<<report2
account3.reports<<report3

account1.save!
account2.save!
account3.save!
account4.save!



# Seed data for Tags
tag_rails = Tag.create(label: "Rails")
tag_tutorial = Tag.create(label: "Tutorial")
link1.tags = [tag_rails]
link2.tags = [tag_rails, tag_tutorial]
link1.save!
link2.save!
