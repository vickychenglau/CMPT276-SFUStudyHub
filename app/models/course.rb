class Course < ActiveRecord::Base
  has_many :topics, :dependent => :delete_all

  validates :name, :presence =>true, uniqueness: true

end
