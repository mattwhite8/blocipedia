
User.delete_all

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

users = User.all


puts "Seed finished"
puts "#{User.count} users created"
