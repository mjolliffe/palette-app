# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Seed courses
courses = Course.create([{name: 'Intro to Calligraphy', instructor: 'Samantha Reither',street_address: '126 North Bonnie Brae Street', zip_code: 92036, course_image_url:'', sessions_per_course: , }, {}])


   t.string   "name"
    t.string   "instructor"
    t.string   "street_address"
    t.integer  "zip_code"
    t.string   "course_image_url"
    t.integer  "sessions_per_course"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "course_day_of_week"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "description"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.decimal  "price",
