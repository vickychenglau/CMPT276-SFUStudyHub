# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  topic_id      :integer
#  user_id       :integer
#  text          :text
#  rating        :integer
#  anon          :boolean
#  parent        :integer
#  postable_id   :integer
#  postable_type :string
#  deleted       :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :postable, polymorphic: true
  has_many :posts, as: :postable
  acts_as_votable

  validates :user_id, :presence =>true
  validates :topic_id, :presence =>true
  validates :anon, :inclusion => {:in => [true, false]}
  validates :deleted, :inclusion => {:in => [true, false]}
  validates :text, presence: true, length: {minimum: 2}

end
