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

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "If course name is there" do
    course=Course.new(:name => "Some name")
    assert course.valid?, "Please enter course name"
  end

  test "Course with no name" do
    course=Course.new()
    assert course.invalid?, "Course does not have an ID"
  end

  test "Course with has blank name" do
    course=Course.new(:name => "")
    assert course.invalid?, "Course has blank name"
  end

  test "Term is blank" do
    course=Course.new(:term => "")
    assert course.invalid?, "Course has no term"
  end

end
