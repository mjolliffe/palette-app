class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  # belongs_to :user
  has_many :reviews

  def to_s
    "#{self.name}"
  end

end
