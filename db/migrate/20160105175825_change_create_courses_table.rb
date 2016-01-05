class ChangeCreateCoursesTable < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.rename :user_id, :creator_id
    end
  end
end
