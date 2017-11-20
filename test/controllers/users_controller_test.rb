require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "Creating a new user" do
    assert_difference('User.count', +1) do
      get :create, user: { username: "Helpsme", email: "jiggywithit@gmail.com",
        last_name: "Kaiserbun", first_name: "Tony", password: "Theword123", role: "admin",
      password_confirmation: "Theword123" }
    end
    assert_redirected_to login_path
    assert_equal "You signed up successfully", flash[:notice]
  end

  test "Passwords do not match creating new user" do
    attrs = FactoryBot.attributes_for(:user)
    assert_difference('User.count', 0) do
      get :create, user: { username: attrs[:username], email: attrs[:email],
        last_name: attrs[:last_name], first_name: attrs[:first_name], password: attrs[:password], role: attrs[:role],
      password_confirmation: "Theword123" }
    end
    assert_response :success
    assert_equal "Sign up failed. Please fix the errors listed below this form.", flash[:notice]
  end

  test "Deleting users" do
    new_user = FactoryBot.create(:user)
    assert_difference('User.count', -1) do
      post :destroy, id: new_user[:id]
    end
    assert_redirected_to users_list_path
  end

  test "Updating user" do
    new_user = FactoryBot.create(:user)
    assert_difference("User.count", 0) do
      put :update, id: new_user[:id], user: { username: new_user[:username],
        email: "Hamesbonderrr@gmail.com", last_name: new_user[:last_name], first_name: new_user[:first_name],
        password: new_user[:password], role: new_user[:role] }
    end
    assert_equal "User updated", flash[:notice]
    assert_redirected_to users_list_path
  end

  test "Fail updating user" do
    new_user = FactoryBot.create(:user)
    assert_difference("User.count", 0) do
      put :update, id: new_user[:id], user: {username: "",
        email: "", last_name: "", first_name: "",
        password: "", role: "" }
    end
    assert_equal "User not updated", flash[:notice]
    assert_template :edit
  end

end
