class Course < ActiveRecord::Base
  # defines the relationship that courses have to users and reviews
  has_and_belongs_to_many :users
  has_many :reviews

  def to_s
    "#{self.name}"
  end

end
