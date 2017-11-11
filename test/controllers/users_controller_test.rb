require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "get dham from fixture" do
    user = users(:david)
    assert user.valid?, "David user is invalid"
  end

end
