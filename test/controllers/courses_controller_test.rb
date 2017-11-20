require 'test_helper'

class CoursesControllerTest < ActionController::TestCase

  setup do
    @course = FactoryBot.create(:course)
  end

  test "Course index page" do
    post :index
    assert_response :success
    assert_select "title", "Courses - Home"
  end

end
