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

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  fixtures :users


  test "If Topic empty" do
    topic = Topic.new
    assert !topic.valid?, "Passing when Topic is empty"
  end

  test "Test if topic is valid" do
    course = Course.new(:name => "Physics 101")
    user=users(:regular)
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    assert topic.valid?, "Valid Topic counts as invalid"
  end

  test "Has no course attached to the Topic" do
    user=users(:regular)
    topic = Topic.new(:user_id => 1 , :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    assert topic.invalid?, "No Course ID attached to topic"
  end

  test "Has no user attached to the Topic" do
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    assert topic.invalid?, "No user attached to the topic"
  end

  test "Topic has no description" do
    course = Course.new(:name => "Physics 101")
    user=users(:regular)
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    assert topic.invalid?, "Topic with no description counts as valid"
  end

  test "Topic has empty description" do
    course = Course.new(:name => "Physics 101")
    user = users(:regular)
    topic = Topic.new(:course_id => 1, :user_id => 1 , :description => "",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    assert topic.invalid?, "Topic with no char in description counts as valid"
  end

  test "Test if topic has no title" do
    course = Course.new(:name => "Physics 101")
    user = users(:regular)
    topic = Topic.new(:course_id => 1, :user_id => 1 , :description => "Tutor",
                      :first_post => "I need a tutor" )
    assert topic.invalid?, "Topic with no title counts as valid"
  end

  test "Test if topic has empty title" do
    course = Course.new(:name => "Physics 101")
    user=users(:regular)
    topic = Topic.new(:course_id => 1, :user_id => 1 , :description => "Tutor",
                      :title => "", :first_post => "I need a tutor" )
    assert topic.invalid?, "Topic with empty string for title counts as valid"
  end

  test "Test if topic had no first_post" do
    course = Course.new(:name => "Physics 101")
    user   = User.new(:username => "Somename", :password => "Somepass",
                      :email => "manikrai29@gmail.com", :first_name => "Somename",
                      :last_name => "Somename", :role => "user")
    topic = Topic.new(:course_id => 1, :user_id => 1 , :description => "Tutor",
                      :title => "Physics 101 help" )
    assert topic.invalid?, "Topic with no first post considered valid"
  end

  test "Test if topic first_post is empty" do
    course = Course.new(:name => "Physics 101")
    user=users(:regular)
    topic = Topic.new(:course_id => 1, :user_id => 1 , :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "" )
    assert topic.invalid?, "Topic with empty first post considered valid"
  end

  test "factory associated is valid" do
    post = FactoryBot.build(:topic)
    assert post.valid?, "Factory is invalid"
  end

end
