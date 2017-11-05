class Topic < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :posts, as: :postable


  validates :title, :presence =>true
end
