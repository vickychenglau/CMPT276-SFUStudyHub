# == Schema Information
#
# Table name: reviews
#
#  id               :integer          not null, primary key
#  comment          :text
#  person_rating_id :integer
#  person_rated_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :person_rating, :class_name => 'User'
  belongs_to :person_rated, :class_name => 'User'

  validates :person_rating, :presence =>true
  validates :person_rated, :presence =>true
  validates :comment, :presence =>true, length: {minimum: 1}
end

