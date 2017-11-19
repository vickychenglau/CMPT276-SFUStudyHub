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

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
