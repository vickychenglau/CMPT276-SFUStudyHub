class Course < ActiveRecord::Base
  has_many :topics, :dependent => :delete_all

  validates :term, :presence =>true
  validates :name, :presence =>true, uniqueness: { scope: [:term] }

end
