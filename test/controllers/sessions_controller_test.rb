require 'test_helper'

class SessionsControllerTest  < ActionController::TestCase
# config.sessions_controller.allow_forgery_protection = false
ActionController::Base.allow_forgery_protection = false
setup do
  @user = FactoryBot.build(:user)
end


  test "should get login," do
    get :login
    assert_response(:success, message = nil)

  end

  test "should get home," do
    get :home
    assert_response(:success, message = nil)
  end


  test "should get setting" do
    get :setting
    assert_response(:success, message = nil)

  end

  test "Check if user can log in" do
    user = FactoryBot.create(:user)
    # ActionController::Base.allow_forgery_protection = false
    assert(User.find_by(id: user[:id]))
    assert(!ActionController::Base.allow_forgery_protection)
    # Unable disable CSRF in tests but works in rails console
    post :login_attempt, params: {login_username: user[:username], login_password: user[:password]}
    assert_equal "Logged in", flash[:notice]
    assert_redirected_to root_path
    # ActionController::Base.allow_forgery_protection = true
  end

  test "User does not exist" do
    get :login_attempt, params: {login_username: "ShallnotPAss", login_password: "What password"}
    assert_equal "Invalid username or password", flash[:notice]
    assert_template :login
  end

  test"Check if user can log out" do
    session[:user_id] = @user[:id]
    get :logout
    assert_equal "Logged out", flash[:notice]
  end


end
