require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "If title is there" do
    topic=Topic.new
    assert !topic.valid?, "Passing when empty"
  end
end
