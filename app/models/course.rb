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

  validates :term, :presence =>true
  validates :name, :presence =>true, uniqueness: { scope: [:term] }

end
