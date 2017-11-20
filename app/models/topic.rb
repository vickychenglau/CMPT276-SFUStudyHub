# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  description :string
#  title       :string
#  course_id   :integer
#  user_id     :integer
#  first_post  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Topic < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :posts, as: :postable, dependent: :nullify


  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :course_id, presence: true
  validates :user_id, presence: true
  validates :first_post, presence: true, length: {minimum: 2}

end
