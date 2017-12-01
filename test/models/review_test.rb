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
	fixtures :reviews
	
  test "Test if valid review is valid" do
    review=Review.new(:comment => "Meh, they are okay...", :person_rated_id => 1,
                  :person_rating_id => 2)
    assert review.valid?, "Valid post is not valid."
  end

  test "Checking to if empty review is valid" do
    review = Review.new
    assert review.invalid?, "Empty review is valid"
  end

  test "Review has blank comment" do
    review=Review.new(:comment => "", :person_rated_id => 1,
                  :person_rating_id => 2)
    assert review.invalid?, "Review has no comment"
  end

  test "If comment is more than 1 character" do
    review=Review.new(:comment => "This is a review", :person_rated_id => 1, 
    				:person_rating_id => 1)
    assert review.valid?, "Review comment > 1 characters is invalid"
  end
end
