require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "If rating is there" do
    post=Post.new(:rating => 5, :text => "Some text")
    assert post.valid?, "Please enter rating"
  end

  test "If text is more than 7 characters" do
    post=Post.new(:rating => 5, :text => "Some text")
    assert post.valid?, "Please enter text more than 7 characters"
  end
end
