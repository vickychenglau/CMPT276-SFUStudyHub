require 'test_helper'

class UserTest < ActiveSupport::TestCase



test "If username is there" do
  user=User.new(:username => "Some name", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Some name", :role => "Some role")
  assert user.valid?, "PLease enter username"
end

test "Password length more than 7" do
  user=User.new(:username => "Some name", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Some name", :role => "Some role")
    assert user.valid?, "Password length must be more than 7 characters"
end


test "Valid email" do
  user=User.new(:username => "Some name", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Some name", :role => "Some role")
  assert user.valid?, "PLease enter a valid email"
end

test "Usernanme and Password cannot be same" do
  user=User.new(:username => "Some name", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Some name", :role => "Some role")
  assert user.valid?, "Usernanme and Password cannot be same"
end

test "If First name is there" do
  user=User.new(:username => "Some name", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Some name", :role => "Some role")
  assert user.valid?, "Please enter First name"
end

test "If role is there" do
  user=User.new(:username => "Some name", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Some name", :role => "Some role")
  assert user.valid?, "PLease enter your role"
end

end
