require 'test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :users

  test "Checking to see if it posts blank" do
    post = Post.new
    assert !post.valid?
  end

  test "If rating is not there" do
    user=users(:regular)
    post=Post.new(:text => "Some textlksdlkjasd", :user_id => 1, :anon => false , :deleted => false)
    assert post.invalid?, "No post rating considered valid"
  end


  test "If text is more than 2 characters" do
    user=users(:regular)
    post=Post.new(:rating => 5, :text => "Some textlksdlkjasd", :user_id => 1, :anon => false, :deleted => false)
    assert post.valid?, "Post Text > 2 characters is invalid"
  end

  test "If text is 2 characters" do
    user=users(:regular)
    post=Post.new(:rating => 5, :text => "So", :user_id => 1, :anon => false, :deleted => false)
    assert post.valid?, "Post Text is 2 characters is invalid"
  end

  test "text is less than 2 characters" do
    user=users(:regular)
    post=Post.new(:rating => 5, :text => "a", :user_id => 1, :anon => false, :deleted => false)
    assert post.invalid?, "Post Text < 2 characters is invalid"
  end

  test "No user with the post" do
    post=Post.new(:rating => 5, :text => "So222113222", :anon => false, :deleted => false)
    assert post.invalid?, "test is valid with no user attached to post"
  end

  test "Rating is 0" do
    user=users(:regular)
    post=Post.new(:rating => 0, :text => "So222113222", :user_id => 1, :anon => false, :deleted => false)
    assert post.valid?, "Rating is zero is invalid"
  end

  test "Rating is below 0" do
    user=users(:regular)
    post=Post.new(:rating => -3, :text => "So222113222", :user_id => 1, :anon => false, :deleted => false)
    assert post.valid?, "Rating below 0 is invalid"
  end

  test "Rating is large " do
    user=users(:regular)
    post=Post.new(:rating => 1000000, :text => "So222113222", :user_id => 1, :anon => false, :deleted => false)
    assert post.valid?, "Large rating is invalid"
  end

  test "Post as anonymous" do
    user=users(:regular)
    post=Post.new(:rating => 5, :text => "So222113222", :user_id => 1, :anon => true, :deleted => false)
    assert post.valid?, "Posting as anonymous fails"
  end

end
