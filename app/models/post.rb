class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :postable, polymorphic: true
  has_many :posts, as: :postable

  validates :rating, :presence =>true
  validates :user_id, :presence =>true
  validates :anon, :inclusion => {:in => [true, false]}
  validates :deleted, :inclusion => {:in => [true, false]}
  validates :text, presence: true, length: {minimum: 2}

end
