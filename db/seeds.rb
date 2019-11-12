# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.find_definitions

dept = Department.find_or_create_by!(name: 'IT') do |dept|
  dept.description = 'Lovely IT department'
end

 30.times do |idx|
   User.find_or_create_by!(email: "awesome_email#{idx}@w.com") do |u|
     u.first_name = "John#{idx}"
     u.last_name = "Doe#{idx}"
     u.password = "Querty!123"
     u.department = dept
   end
 end