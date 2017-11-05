class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :postable, polymorphic: true
  has_many :posts, as: :postable





  validates :rating, :presence =>true
  validates_length_of :text, presence: true, :minimum => 7




end
