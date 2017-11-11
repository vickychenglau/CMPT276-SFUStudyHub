require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "Checking to see if it posts blank" do
    post = Post.new
    assert !post.valid?
  end

  test "If rating is there" do
    user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :role => "Some role")
    post=Post.new(:text => "Some textlksdlkjasd", :user_id => 1, :anon => false, :parent => 0 , :deleted => false)
    assert !post.valid?, "Cannot miss rating"
  end


  test "If text is more than 7 characters" do
    user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :role => "Some role")
    post=Post.new(:rating => 5, :text => "Some textlksdlkjasd", :user_id => 1, :anon => false, :parent => 0 , :deleted => false)
    assert post.valid?, "Please enter text more than 7 characters"
  end

  test "text is less than 7 characters" do
    user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :role => "Some role")
    post=Post.new(:rating => 5, :text => "So", :user_id => 1, :anon => false, :parent => 0 , :deleted => false)
    assert post.invalid?, "test is valid with less than 7 characters"
  end

  test "No user with the post" do
    post=Post.new(:rating => 5, :text => "So", :user_id => 1, :anon => false, :parent => 0 , :deleted => false)
    assert post.invalid?, "test is valid with no user attached to message"
  end

end
