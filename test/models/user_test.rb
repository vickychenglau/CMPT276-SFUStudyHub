require 'test_helper'

class UserTest < ActiveSupport::TestCase

test "User is blank" do
  user = User.new
  assert !user.valid?, "Saved the user without anything"
end

test "If username is there" do
  user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "admin")
  assert user.valid?, "PLease enter username"
end

test "Password length more than 7" do
  user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "Some role")
    assert user.valid?, "Password length must be more than 7 characters"
end


test "Valid email" do
  user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "Some role")
  assert user.valid?, "PLease enter a valid email"
end

test "Usernanme and Password cannot be same" do
  user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "Some role")
  assert user.valid?, "Usernanme and Password cannot be same"
end

test "If First name is there" do
  user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "Some role")
  assert user.valid?, "Please enter First name"
end

test "If role is there" do
  user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "Some role")
  assert user.valid?, "PLease enter your role"
end

# Do tests properly, you keep testing the same thing and that is if the user is valid with the same data
# All your test are exactly the same which does not mean anything and is redundant

test "Check if user is valid" do
  user=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "Some role", :last_name=> "Lastname")
  assert user.valid?, "User is invalid"
end

# All your tests can be summed into this single test above

test "Username required" do
  user=User.new(:password => "Somepass1", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "user", :last_name=> "LastName")
  assert user.invalid?, "Valid without username"
end

test "Password required" do
  user=User.new(:username => "Somename", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "user", :last_name=> "LastName")
  assert user.invalid?, "Valid without password"
end

test "Email required" do
  user=User.new(:username => "Somename", :password => "Somepass1",
                :first_name => "Somename", :role => "user", :last_name=> "LastName")
  assert user.invalid?, "valid without email"
end

test "Last name required" do
  user=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                :first_name => "Somename", :role => "user")
  assert user.invalid?, "valid without last name"
end

test "First name required" do
  user=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                :role => "user", :last_name=> "LastName")
  assert user.invalid?, "valid without first name"
end

test "No first name or last name required" do
  user=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                :role => "user", :last_name=> "LastName")
  assert user.invalid?, "valid with no name inputs"
end

test "Username is unique" do
  user1=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                :role => "user", :last_name=> "LastName", :first_name=> "kljaklsd")
  user2=User.new(:username => "Somename", :password => "dfasdf1", :email => "asdfasdf@gmail.com",
                :role => "user", :last_name=> "kjlahsd", :first_name=> "kljaklsd")
  assert user2.invalid?, "two accounts with same username"
end

test "Two accounts can have same first name and last name" do
  user1=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                :role => "user", :last_name=> "LastName", :first_name=> "Firstname")
  user2=User.new(:username => "User2", :password => "dfasdf1", :email => "asdfasdf@gmail.com",
                :role => "user", :last_name=> "LastName", :first_name=> "Firstname")
  assert user2.valid?, "two accounts cannot have same last and first name"
end

test "Email is unique" do
  user1=User.new(:username => "Somename", :password => "Somepass", :email => "manikrai29@gmail.com",
                :role => "user", :last_name=> "LastName", :first_name=> "kljaklsd")
  user2=User.new(:username => "Somenameeee", :password => "dfasdf1", :email => "manikrai29@gmail.com",
                :role => "user", :last_name=> "kjlahsd", :first_name=> "kljaklsd")
  assert user2.invalid?, "two accounts with same username"
end

test "Email is invalid" do
  user1=User.new(:username => "Somename", :password => "Somepass1", :email => "kasjldhf",
                :role => "user", :last_name=> "LastName", :first_name=> "kljaklsd")
  assert user1.invalid?, "Validating jibberish as an Email"
end

  test "Email missing @ symbol" do
    user1=User.new(:username => "Somename", :password => "Somepass1", :email => "jimmyhotmail.com",
                  :role => "user", :last_name=> "LastName", :first_name=> "kljaklsd")
    assert user1.invalid?, "Validating without @ symbol"
  end

  test "Email missing .com" do
    user1=User.new(:username => "Somename", :password => "Somepass1", :email => "kljdlldkd@live",
                  :role => "user", :last_name=> "LastName", :first_name=> "kljaklsd")
    assert user1.invalid?, "Validating without .com symbol"
  end

  test "Username and pass are not the same" do
    user=User.new(:username => "Somename1", :password => "Somename1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :role => "Some role")
    assert user.invalid?, "Usernanme and Password are the same"
  end

  test "No role assigned" do
    user=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName")
    assert user.invalid?, "Valid without a role"
  end

  test "Admin role is valid" do
    user=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "admin")
    assert user.valid?, "Admin role is invalid"
  end

  test "User role is valid" do
    user=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.valid?, "User role is invalid"
  end

  test "Random role is valid" do
    user=User.new(:username => "Somename", :password => "Somepass1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "asdlkfja")
    assert user.invalid?, "Validating roles outside of Admin and User"
  end

  test "Password has has at least a capitals" do
    user=User.new(:username => "Somename", :password => "2929mcmcm", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.invalid?, "Password no capital characters"
  end

  test "Password has at least a number" do
    user=User.new(:username => "Somename", :password => "CCCmmmms", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.invalid?, "Password contains no number"
  end

  test "Password has no character" do
    user=User.new(:username => "Somename", :password => "", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.invalid?, "Password no characters"
  end

  test "Password is one character" do
    user=User.new(:username => "Somename", :password => "S", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.invalid?, "Password is 1 character"
  end

  test "Password is two character" do
    user=User.new(:username => "Somename", :password => "S1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.invalid?, "Password is 2 character"
  end

  test "Password is three character" do
    user=User.new(:username => "Somename", :password => "Sa1", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.invalid?, "Password is 3 character"
  end

  test "Password is four character" do
    user=User.new(:username => "Somename", :password => "Sa1m", :email => "manikrai29@gmail.com",
                  :first_name => "Somename", :last_name=> "LastName", :role => "user")
    assert user.invalid?, "Password is 4 character"
  end

end
