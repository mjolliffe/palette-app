class CreateUserCoursesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :user, :course
  end

    def down
    drop_table :course_user
  end
end
