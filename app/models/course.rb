class Course < ActiveRecord::Base
  has_many :courses_users
  has_many :users, through: :courses_users
  belongs_to :user
end
