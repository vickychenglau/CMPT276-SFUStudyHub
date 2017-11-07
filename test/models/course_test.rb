require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "If course name is there" do
    course=Course.new(:name => "Some name")
    assert course.valid?, "Please enter course name"
  end
end
