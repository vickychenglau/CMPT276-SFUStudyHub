class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic





  validates :rating, :presence =>true
  validates_length_of :text, presence: true, :minimum => 7




end
