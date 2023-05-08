# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ===== Custom Users =====
# u_name = "test"
# domain = "@gmail.com"
# (5).times do |a|
#   usr = User.new(email: u_name+a.to_s+domain, password: 123456)
#   usr.skip_confirmation!
#   usr.save!
#
#   puts usr
# end

# ===== Project =====
# (2).times do |p|
#   pro = Project.new(title: "Project #{p}",
#                     description: Faker::Lorem.characters(number: 100))
#   pro.save!
# end
# puts "Projects created"
#
# # ===== Task =====
# project = Project.first
# user = User.first
# (5).times do |t|
#   task = Task.new(title: "Task #{t}",
#                   description: Faker::Lorem.characters(number: 50),
#                   status: 'YET TO START',
#                   estimation: 1,
#                   assigned_user: user.email,
#                   project_id: project.id)
#   task.save!
# end
# puts "Tasks created"