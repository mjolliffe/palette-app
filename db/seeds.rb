# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Class.create()

# Seed departments
departments = ["HR", "Legal", "Accounting", "Engineering", "Sales"]
departments.each do |name|
    Department.create(name: name)
end

# Seed employees
100.times do
    Employee.create(name: Faker::Name.name, age: Faker::Number.between(18,65), address: Faker::Address.street_address, salary: Faker::Number.between(30000,100000), department_id: Faker::Number.between(1,5) )
end
