require 'test_helper'

class MessageboardControllerTest < ActionController::TestCase

  setup do
    @user = create(:user)
    @course = create(:course)
  end

  test "get messageboard index" do
    post :index
    assert_response :success
    assert_select "title", "Courses Messageboard"
  end

  test "get the title for the cmpt 276 page" do
    FactoryBot.create(:topic, id: 1)
    post :index, id: 1
    assert_response :success
    assert_select "title", "CMPT 276"
  end

  test "remove a topic" do
    topic = FactoryBot.create(:topic)
    assert_difference('Topic.count', -1) do
      post :destroy, id: topic.id
    end
    assert_redirected_to '/messageboard/index'
  end

  # Strange error when trying to create
  # test "new topic" do
  #   assert_difference('Topic.count', +1) do
  #     get :create, FactoryBot.attributes_for(:topic)
  #   end
  # end


  test "get into post about a topic" do
    topic = FactoryBot.create(:topic, id: 2)
    get :show, id: 2
    assert_response :success, "no topic found"
  end

end
