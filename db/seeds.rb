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