# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
courses = Course.create([{
  name:"B+W Photography",
  instructor:"Lee Saper",
  street_address:"811 W 7th St",
  zip_code: "90017",
  course_image_url: "http://webneel.com/daily/sites/default/files/images/daily/04-2013/21-wet-corridor-by-rui-palha-bw-photography.jpg",
  sessions_per_course: "1",
  start_date: "04/22/2016",
  end_date: "04/22/2016",
  course_day_of_week: "Friday",
  start_time: "6 PM",
  end_time: "9 PM",
  description: "Learn the basics of black and white photography.",
  price: 250,
  creator_id: 1
  },
  {
  name:"Ceramics 101",
  instructor:"Melissa Dichter",
  street_address:"2411 Glendale Blvd.",
  zip_code: "90039",
  course_image_url: "http://www.creswell.k12.or.us/wp/stepp/files/2015/09/clay11.jpg",
  sessions_per_course: "1",
  start_date: "04/20/2016",
  end_date: "04/20/2016",
  course_day_of_week: "Wednesday",
  start_time: "12 PM",
  end_time: "5 PM",
  description: "Learn the basics of sculpting and firing clay.",
  price: 250,
  creator_id: 2
  }])

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
