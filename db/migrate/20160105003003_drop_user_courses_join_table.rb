class DropUserCoursesJoinTable < ActiveRecord::Migration
  def up
    drop_table :course_user
  end
end
