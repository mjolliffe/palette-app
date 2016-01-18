class Review < ActiveRecord::Base
  # defines the relationship reviews have to users and courses
  belongs_to :user
  belongs_to :course
end
