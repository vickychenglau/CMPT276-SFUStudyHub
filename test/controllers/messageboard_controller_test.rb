require 'test_helper'

class MessageboardControllerTest < ActionController::TestCase

  setup do
    @user = FactoryBot.create(:user)
    @course = FactoryBot.create(:course)
  end

  test "get messageboard index" do
    post :index
    assert_response :success
    assert_select "title", "Courses Messageboard"
  end

  test "all the topics are shown" do
    post :index
    assert_response :success
    assert_select "dl dt", Topic.all.count
  end

  test "get the title for the cmpt 276 page" do
    message = FactoryBot.create(:topic)
    post :index, course: message.course.id
    assert_response :success
    assert_select "title", message.course.name
  end

  test "remove a topic" do
    topic = FactoryBot.create(:topic)
    assert_difference('Topic.count', -1) do
      post :destroy, id: topic.id
    end
    assert_redirected_to '/messageboard/index'
  end

  test "show topic" do
    topic = FactoryBot.create(:topic)
    get :show, id: topic.id
    assert_response :success
    assert_select "title", topic.title
  end

  test "new topic" do
    person = FactoryBot.create(:user)
    course = FactoryBot.create(:course)
    topic = attributes_for(:topic)
    session[:user_id] = person.id
    assert_difference('Topic.count', +1) do
      get :create, topic: {title: "Help me", first_post: "Yaa",
        description: "general", course: course.id}
    end
    # assert_response :redirect
    assert_redirected_to controller:"messageboard", action: "index", course: course.id
  end


  test "get into post about a topic" do
    topic = FactoryBot.create(:topic, id: 2)
    get :show, id: 2
    assert_response :success, "no topic found"
  end

end
