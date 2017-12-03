# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  term       :string
#

class Course < ActiveRecord::Base
  has_many :topics, :dependent => :delete_all
  has_many :tutorings
  has_many :users, through: :topics
  acts_as_followable
  acts_as_follower

  validates :term, :presence =>true, format: { with: /\A(Spring|Summer|Fall) {1}20\d{2}/ }, :on => :create
  validates :name, :presence =>true, uniqueness: { scope: [:term] }

  def term_and_name
  	"#{name} (#{term})"
  end

end
