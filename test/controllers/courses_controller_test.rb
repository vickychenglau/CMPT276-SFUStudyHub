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

  test "all the courses are shown" do
    post :index
    assert_response :success
    # multiple td therefore it is doubled
    assert_select 'tr td', 2*Course.all.count
  end

  test "Creating a new course" do
    course = FactoryBot.attributes_for(:course)
    assert_difference('Course.count', +1) do
      get :create, course: {name: course[:name], term: course[:term]}
    end
    assert_equal "Successfully added #{course[:name]}", flash[:notice]
    assert_redirected_to courses_path
  end

  test "Failing to create a new course" do
    course = Course.new(name: "", term: "")
    assert_difference('Course.count', 0) do
      get :create, course: {name: course.name, term: course.term }
    end
    assert_equal "Course not added", flash[:notice]
    assert_template :new
  end

  test "Removing a course" do
    course = FactoryBot.create(:course)
    assert_difference('Course.count', -1) do
      get :destroy, id: course[:id]
    end
    assert_equal "Deleted #{course[:name]}", flash[:notice]
    assert_redirected_to courses_path
  end

  test "Updating a course" do
    assert_difference('Course.count', 0) do
      put :update, id:@course[:id] ,course: {name: "CMPT 300", term: "fall"}
    end
    assert_equal "Course updated", flash[:notice]
    assert_redirected_to courses_path
  end

end
