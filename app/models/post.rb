class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :postable, polymorphic: true
  has_many :posts, as: :postable

  #validates :rating, :presence =>true
  #validates :user_id, :presence =>true
  #validates :parent, :presence =>true
  #validates :anon, :presence =>true
  validates_length_of :text, presence: true, :minimum => 1

end
