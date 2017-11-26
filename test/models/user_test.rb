# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  last_name  :string
#  first_name :string
#  email      :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

test "User is blank" do
  user = User.new
  assert user.invalid?, "Saved the user without anything"
end

test "If username is there" do
  user=User.new(:username => "Somename", :password => "Somepass1",
                :email => "manikrai29@gmail.com", :first_name => "Somename",
                :last_name=> "LastName", :role => "admin", :tutor => true)
  assert user.valid?, "Invalid with username"
end

test "Username required" do
  user=User.new(:password => "Somepass1", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "user",
                :last_name=> "LastName", :tutor => true)
  assert user.invalid?, "Valid without username"
end

test "Password required" do
  user=User.new(:username => "Somename", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "user",
                :last_name=> "LastName", :tutor => true)
  assert user.invalid?, "Valid without password"
end

test "Email required" do
  user=User.new(:username => "Somename", :password => "Somepass1",
                :first_name => "Somename", :role => "user",
                :last_name=> "LastName", :tutor => true)
  assert user.invalid?, "valid without email"
end

test "Last name required" do
  user=User.new(:username => "Somename", :password => "Somepass1",
                :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "user", :tutor => true)
  assert user.invalid?, "valid without last name"
end

test "First name required" do
  user=User.new(:username => "Somename", :password => "Somepass1",
                :email => "manikrai29@gmail.com", :role => "user",
                :last_name=> "LastName", :tutor => true)
  assert user.invalid?, "valid without first name"
end

test "No first name or last name required" do
  user=User.new(:username => "Somename", :password => "Somepass1",
                :email => "manikrai29@gmail.com", :role => "user", :tutor => true)
  assert user.invalid?, "valid with no name inputs"
end

test "Username is unique" do
  user1=users(:regular)
  user2=User.new(:username => "Username1", :password => "Somepass1",
                 :email => "asdfasdf@gmail.com", :role => "user",
                 :last_name=> "kjlahsd", :first_name=> "kljaklsd", :tutor => true)
  assert user2.invalid?, "two accounts with same username"
end

test "Two accounts can have same first name and last name" do
  user1=User.new(:username => "Somename", :password => "Somepass1",
                 :email => "manikrai29@gmail.com", :role => "user",
                 :last_name=> "LastName", :first_name=> "Firstname", :tutor => true)
  user2=User.new(:username => "User2", :password => "Somepass1",
                 :email => "asdfasdf@gmail.com", :role => "user",
                 :last_name=> "LastName", :first_name=> "Firstname", :tutor => true)
  assert user2.valid?, "two accounts cannot have same last and first name"
end

test "Email is unique" do
  user1=users(:regular)
  user2=User.new(:username => "Somenameeee", :password => "Somepass1",
                 :email => "regular@sfu.ca", :role => "user",
                 :last_name=> "kjlahsd", :first_name=> "kljaklsd", :tutor => true)
  assert user2.invalid?, "two accounts with same email"
end

test "Email is invalid" do
  user1=User.new(:username => "Somename", :password => "Somepass1",
                 :email => "kasjldhf", :role => "user", :last_name=> "LastName",
                 :first_name=> "kljaklsd", :tutor => true)
  assert user1.invalid?, "Validating jibberish as an Email"
end

  test "Email missing @ symbol" do
    user1=User.new(:username => "Somename", :password => "Somepass1",
                   :email => "jimmyhotmail.com", :role => "user",
                   :last_name=> "LastName", :first_name=> "kljaklsd", :tutor => true)
    assert user1.invalid?, "Validating without @ symbol"
  end

  test "Email missing .com" do
    user1=User.new(:username => "Somename", :password => "Somepass1",
                   :email => "kljdlldkd@live", :role => "user",
                   :last_name=> "LastName", :first_name=> "kljaklsd", :tutor => true)
    assert user1.invalid?, "Validating without .com symbol"
  end

  test "Username and pass are not the same" do
    user=User.new(:username => "Somename1", :password => "Somepass1",
                  :email => "manikrai29@gmail.com", :first_name => "Somename",
                  :last_name => "LastName", :role => "Some role", :tutor => true)
    assert user.invalid?, "Username and Password are the same"
  end

  test "No role assigned" do
    user=User.new(:username => "Somename", :password => "Somepass1",
                  :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :tutor => true)
    assert user.invalid?, "Valid without a role"
  end

  test "admin role is valid" do
    user=User.new(:username => "Somename", :password => "Somepass1",
                  :email => "manikrai29@gmail.com", :first_name => "Somename",
                  :last_name=> "LastName", :role => "admin", :tutor => true)
    assert user.valid?, "admin role is invalid"
  end

  test "user role is valid" do
    user=User.new(:username => "Somename", :password => "Somepass1",
                  :email => "manikrai29@gmail.com", :first_name => "Somename",
                  :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.valid?, "user role is invalid"
  end

  test "Random role is valid" do
    user=User.new(:username => "Somename", :password => "Somepass1",
                  :email => "manikrai29@gmail.com", :first_name => "Somename",
                  :last_name=> "LastName", :role => "asdlkfja", :tutor => true)
    assert user.invalid?, "Validating roles outside of Admin and User"
  end

  test "Password has has at least a capitals" do
    user=User.new(:username => "Somename", :password => "2929mcmcm", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.invalid?, "Password no capital characters"
  end

  test "Password has at least a number" do
    user=User.new(:username => "Somename", :password => "CCCmmmmms", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.invalid?, "Password contains no number"
  end

  test "Password has no character" do
    user=User.new(:username => "Somename", :password => "", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.invalid?, "Password no characters"
  end

  test "Password is one character" do
    user=User.new(:username => "Somename", :password => "S", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.invalid?, "Password is 1 character"
  end

  test "Password is two character" do
    user=User.new(:username => "Somename", :password => "S1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.invalid?, "Password is 2 character"
  end

  test "Password is three character" do
    user=User.new(:username => "Somename", :password => "Sa1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.invalid?, "Password is 3 character"
  end

  test "Password is four character" do
    user=User.new(:username => "Somename", :password => "Sa1m", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.invalid?, "Password is 4 character"
  end

  test "factory if it works" do
    user = FactoryBot.build(:user, username: "batman")
    assert user.valid?, "Factory is invalid"
  end

  test "admin class" do
    admin = FactoryBot.build(:admin)
    assert admin.valid?, "Factory admin is invalid"
  end

  test "tutor attribute is valid" do
    user=User.new(:username => "Somename", :password => "Somepass1",
                  :email => "manikrai29@gmail.com", :first_name => "Somename",
                  :last_name=> "LastName", :role => "user", :tutor => true)
    assert user.valid?, "Tutor attribute is valid"

    test "status is valid" do
    user=User.new(:username => "Somename", :password => "Sa1m", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user", :tutor => true, :status=> "I love CMPT276 so much!")
    assert user.invalid?, "Status can be at most 50 characters"
  end
  end
end
