class CoursesController < ApplicationController
before_action :find_course, only: [:show, :edit, :update, :destroy]

  # Default view shows all courses
  def index
    @courses = Course.all
  end

  # Add new course
  def new
  	@course = Course.new
  end

  # Create new course
  def create
   	@course = Course.new(course_params)
    @course.term = @course.term.capitalize
    if @course.save
      flash[:notice] = "Successfully added #{@course.name}"
      redirect_to courses_path
    else
      flash[:notice] = "Course not added. Please double-check your input."
 	    render 'new'
    end
  end

  # Edit course. I don't remember why I set up edit and update as separate methods
  # but I don't want to tinker with this now
  def edit
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Course updated"
      redirect_to courses_path
    else
      flash[:notice] = "Course failed to update"
      render 'edit'
    end
  end

  # Delete course
  def destroy
    flash[:notice] = "Deleted #{@course.name}"
  	@course.destroy
  	redirect_to courses_path
  end

  # Download courses
  def download
  end


  # These variables are used above
  private
  	def course_params
  		params.require(:course).permit(:name, :term)
	  end

    def find_course
      @course = Course.find(params[:id])
    end

end
