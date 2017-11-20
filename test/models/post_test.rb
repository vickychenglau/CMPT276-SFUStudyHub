# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  topic_id      :integer
#  user_id       :integer
#  text          :text
#  rating        :integer
#  anon          :boolean
#  parent        :integer
#  postable_id   :integer
#  postable_type :string
#  deleted       :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :users

  test "Test if valid post is valid" do
    user=users(:regular)
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "Some textlksdlkjasd", :user_id => 1,
                  :topic_id => 1, :anon => false , :deleted => false)
    assert post.valid?, "Valid post is not valid."
  end

  test "Checking to if empty post is valid" do
    post = Post.new
    assert post.invalid?, "Empty post is valid"
  end

  test "If text is more than 2 characters" do
    user=users(:regular)
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "Some text", :user_id => 1, :topic_id => 1,
                  :anon => false , :deleted => false)
    assert post.valid?, "Post Text > 2 characters is invalid"
  end

  test "If text is 2 characters" do
    user=users(:regular)
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "So", :user_id => 1, :topic_id => 1,
                  :anon => false, :deleted => false)
    assert post.valid?, "Post Text is 2 characters is invalid"
  end

  test "text is less than 2 characters" do
    user=users(:regular)
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "a", :user_id => 1, :topic_id => 1,
                  :anon => false, :deleted => false)
    assert post.invalid?, "Post Text < 2 characters is valid"
  end

  test "No user with the post" do
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "So222113222", :topic_id => 1,
                  :anon => false, :deleted => false)
    assert post.invalid?, "test is valid with no user attached to post"
  end

  test "No user with user ID" do
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "a", :user_id => 9, :topic_id => 1,
                  :anon => false, :deleted => false)
    assert post.invalid?, "test is valid with nonexistent user_id"
  end

  test "No topic with the post" do
    user=users(:regular)
    post=Post.new(:text => "So222113222", :user_id => 1,
                  :anon => false, :deleted => false)
    assert post.invalid?, "test is valid with no topic attached to post"
  end

  test "No topic with topic ID" do
    user=users(:regular)
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "a", :user_id => 1, :topic_id => 9,
                  :anon => false, :deleted => false)
    assert post.invalid?, "test is valid with nonexistent topic_id"
  end

  test "Post as anonymous" do
    user=users(:regular)
    course = Course.new(:name => "Physics 101")
    topic = Topic.new(:course_id => 1, :user_id => 1 ,
                      :description => "Tutor",
                      :title => "Physics 101 help",
                      :first_post => "I need a tutor" )
    post=Post.new(:text => "So222113222", :user_id => 1, :topic_id => 1,
                  :anon => true, :deleted => false)
    assert post.valid?, "Posting as anonymous fails"
  end

end
