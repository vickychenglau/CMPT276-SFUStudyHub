require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "If title is there" do
    topic=Topic.new(:title => "Some title")
    assert topic.valid?, "Please enter title"
  end
end
