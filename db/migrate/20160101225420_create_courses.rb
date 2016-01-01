class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :instructor
      t.string :street_address
      t.integer :zip_code
      t.string :course_image_url
      t.integer :sessions_per_course
      t.date :start_date
      t.date :end_date
      t.string :course_day_of_week
      t.string :start_time
      t.string :end_time
      t.string :description

      t.timestamps null: false
    end
  end
end
