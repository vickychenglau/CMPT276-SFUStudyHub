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

  fixtures :courses
  
  test "Course with no parameters" do
    course=Course.new()
    assert course.invalid?, "Passing when course is empty"
  end

  test "Course with has blank name" do
    course=Course.new(:term => "Spring 2018", :name => "")
    assert course.invalid?, "Course has blank name"
  end

  test "Course with blank term" do
    course=Course.new(:term => "", :name => "CMPT276")
    assert course.invalid?, "Course has blank term"
  end

  test "Term/course combo is unique" do
    course1=courses(:one)
    course2=Course.new(:term => "Spring 2018", :name => "CMPT276")
    assert course2.invalid?, "Trying to create course that already exists"
  end

  test "Term has valid format" do
    course=Course.new(:term => "Fall2018", :name => "CMPT276")
    assert course.invalid?, "Term must be in correct format"
  end


end
