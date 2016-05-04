# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
account_lpi = Account.create!(email: "lpi@memphis.edu", password: "12345678", sign_in_count: 10, level: 0)


# Account-link seed data (work)

# account1.links << link1
# account2.links << link2
# account3.links << link3
# account4.links << link4
# account_lpi.links << link5
# account_alice.links = [link6, link7, link8]
# account_alice.save!


# link seed data
link1 = Link.create(
  url:'https://www.youtube.com/watch?v=TnXXR7IOYiI&feature=youtu.be',
  title:'Ruby on Rails tutorial',
  description:'This is a very useful tutorial for creating model class',
  level:1,
  user: account1
  )
link1.created_at = (rand*10).days.ago
link1.save!
link2 = Link.create(
  url:'https://en.wikipedia.org/wiki/Theory_of_computation',
  title:'Theory of computation',
  description:'This link gives information about TOC',
  level:1,
  user: account2
  )
link2.created_at = (rand*10).days.ago
link2.save!
link3 = Link.create(
  url:'http://lsa.colorado.edu/papers/dp1.LSAintro.pdf',
  title:'Latent semantic analysis',
  description:'It addresses the concept of LSA in detail',
  level:1,
  user: account3
)
link3.created_at = (rand*10).days.ago
link3.save!
link4 = Link.create(
  url:'http://bluebrain.epfl.ch/',
  title:'Blue Brain Demo',
  description:'This is a project by IBM',
  level:1,
  user: account4
  )
link4.created_at = (rand*10).days.ago
link4.save!
link5 = Link.create(
  url:'http://guides.rubyonrails.org/',
  title:'Learn Ruby in 5 days',
  description:'A tutorial which can teach you ruby in 5 days',
  level:1,
  user: account_lpi
)
link5.created_at = (rand*10).days.ago
link5.save!

link6 = Link.create(
  url:'https://www.railstutorial.org/',
  title:'Learn Rails in 3 days Demo',
  description:'A tutorial which can teach you ruby in 5 days',
  level:1,
  user: account_alice
  )
link6.created_at = (rand*10).days.ago
link6.save!
link7 = Link.create(
  url:'https://www.railstutorial.org/book',
  title:'Rails Book',
  description:'A tutorial which can teach you ruby in 5 days',
  level:1,
  user: account_alice
  )
link7.created_at = (rand*10).days.ago
link7.save!
link8 = Link.create(
  url:'https://www.railstutorial.org/book/toy_app',
  title:'Rails Book Chapter 2',
  description:'A tutorial which can teach you ruby in 5 days',
  level:2,
  user: account_alice
  )
link8.created_at = (rand*10).days.ago
link8.save!



# rating seed data

rate1 = Rating.create!(value: 1)
rate2 = Rating.create!(value: 1)
rate3 = Rating.create!(value: 1)
rate4 = Rating.create!(value: -1)
rate5 = Rating.create!(value: 1)
rate6 = Rating.create!(value: -1)



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

# account1.followships << account2 << account3
account_alice.followers = [account_trudy]
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

# Seed data for Comments
comment1 = Comment.create!(comment: "It is a good textbook!", created_at: "2016-04-27 03:58:53 UTC")
comment2 = Comment.create!(comment: "It is not good as I thought!", created_at: "2016-04-28 06:08:23 UTC")
comment3 = Comment.create!(comment: "Try google this book <Best Ruby rails guildbook>~", created_at: "2016-04-28 08:23:25 UTC")
comment4 = Comment.create!(comment: "No way. This is the best ever.", created_at: "2016-04-28 15:31:19 UTC")
comment5 = Comment.create!(comment: "XDDDDDDD", created_at: "2016-04-29 03:00:53 UTC")

comment6 = Comment.create!(comment: "This link is not friendly to the rookie like me :(", created_at: "2016-05-01 11:28:53 UTC")
comment7 = Comment.create!(comment: "I can't agree any more. Can anyone share some useful links please?", created_at: "2016-05-02 05:25:53 UTC")


account1.comments << comment1 << comment4
account2.comments << comment2 << comment5
account3.comments << comment3
account4.comments << comment6
account5.comments << comment7
link1.comments << comment1 << comment2 << comment3 << comment4 << comment5
link2.comments << comment6 << comment7
#profile pic 
av_pic1 = File.new(File.join(Rails.root, "app/assets/images/Screenshot.png"))

# Profile seed data
profile1 = Profile.create!(first_name: "James", last_name: "Bond" , avatar: av_pic1)
profile2 = Profile.create!(first_name: "Alice", last_name: "Scalet",avatar: av_pic1)
profile3 = Profile.create!(first_name: "Bob", last_name: "Brown",avatar: av_pic1)
profile4 = Profile.create!(first_name: "Clare", last_name: "Grace",avatar: av_pic1)
profile5 = Profile.create!(first_name: "Tesler", last_name: "Lux",avatar: av_pic1)
profile6 = Profile.create!(first_name: "Lijia", last_name: "Wang",avatar: av_pic1)
profile7 = Profile.create!(first_name: "Bob", last_name: "Alex",avatar: av_pic1)
profile8 = Profile.create!(first_name: "Alice", last_name: "Alex",avatar: av_pic1)
profile9 = Profile.create!(first_name: "Trudy", last_name: "Alex",avatar: av_pic1)
profile10 = Profile.create!(first_name: "Lei", last_name: "Pi",avatar: av_pic1)


# profile1.account = account1
# profile2.account = account2
# profile3.account = account3
# profile4.account = account4
# profile5.account = account5
# profile6.account = account6

account1.profile = profile1
account2.profile = profile2
account3.profile = profile3
account4.profile = profile4
account5.profile = profile5
account6.profile = profile6
account_bob.profile = profile7
account_alice.profile = profile8
account_trudy.profile = profile9
account_lpi.profile = profile10