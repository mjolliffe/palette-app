class CreateUsersCoursesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :courses
  end
end
