require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "If title is there" do
    topic=Topic.new
    assert !topic.valid?, "Passing when empty"
  end

  test "Test if post is valid" do
    course = Course.new(:name => "Physics 225")
    user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :role => "Some role")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,:description => "First year physics", :text => "I need a tutor", :title => "Physics 101 help")
    assert topic.valid?, "Valid post counts as invalid"
  end

  test "Has no user attached to the Topic" do
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :description => "First year physics", :text => "I need a tutor", :title => "Physics 101 help")
    assert topic.invalid?, "No user attached to the topic"
  end
end
