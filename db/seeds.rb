# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

users = User.create([{
  name: "Michelle Jolliffe",
  email: "michelle_jolliffe@alumni.brown.edu",
  zip_code: 90026,
  description: "Graphic Designer + Web Developer",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Lee Saper",
  email: "lee@gmail.com",
  zip_code: 91006,
  description: "Geologist + Photographer",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Melissa Dichter",
  email: "melissa@gmail.com",
  zip_code: 90026,
  description: "Ceramicist",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Brandon Collins",
  email: "brandon@gmail.com",
  zip_code: 90024,
  description: "Muralist",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Christopher Navarro",
  email: "chris@gmail.com",
  zip_code: 90026,
  description: "Abstract Painter",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Tomas Nigelson",
  email: "tom@gmail.com",
  zip_code: 91108,
  description: "Designer",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Erica Nobel",
  email: "erica@gmail.com",
  zip_code: 90013,
  description: "Calligrapher",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Carlos Garcia",
  email: "carlos@gmail.com",
  zip_code: 90026,
  description: "Writer",
  password_digest: "testing",
  remember_digest: "testing"
  },{
  name: "Angela Michaels",
  email: "angela@gmail.com",
  zip_code: 90024,
  description: "Quilt Maker",
  password_digest: "testing",
  remember_digest: "testing"
    }])

reviews = Review.create([{
  user_id: 1,
  course_id: 1,
  content: ""
  },{
  user_id: 2,
  course_id: 1,
  content:""
    }])
