class Topic < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :posts, as: :postable


  validates :title, :presence =>true
  validates :description, :presence => true
  validates :course_id, :presence =>true
  validates :user_id, :presence => true

end
