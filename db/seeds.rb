require 'faker'

User.delete_all
Wiki.delete_all
Collaboration.delete_all

#Create an admin user
admin = User.new(
  name:    'Admin User',
  email:   'admin@example.com',
  password:'helloworld'
  )
admin.skip_confirmation!
admin.save!

#Create a member
member = User.new(
  name:    'Member User',
  email:   'member@example.com',
  password:'helloworld'
  )
member.skip_confirmation!
member.save!

#Create a member
member = User.new(
  name:    'Matt',
  email:   'matt@example.com',
  password:'helloworld'
  )
member.skip_confirmation!
member.save!

users = User.all

#Create Wikis
10.times do 
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: false
    )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
