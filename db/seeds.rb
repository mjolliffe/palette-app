# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Seed courses
courses = Course.create([{
name: "Beginning Modern Calligraphy",
instructor: "Michelle Jolliffe",
street_address: "9355 Airway Rd. #4",
zip_code: 92154,
course_image_url: "http://juliabausenhardt.com/wp-content/uploads/2015/07/01-beginners-guide-to-calligraphy1.jpg",
sessions_per_course: 1,
start_date: "2016-12-12",
end_date: "2016-12-12",
course_day_of_week: "Monday",
description: "Learn the basics of modern calligraphy with a local expert. Ink, paper, and quills provided!",
price: "90.0",
creator_id: 1
}])
