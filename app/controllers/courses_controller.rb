class CoursesController < ApplicationController
before_action :find_course, only: [:show, :edit, :update, :destroy]


  def index
    @courses = Course.all
  end

  def new
  	@course = Course.new
  end

  def create
  	@course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Successfully added #{@course.name}"
      redirect_to courses_path
    else
      flash[:notice] = "Course not added"
   	  render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end


  def destroy
    flash[:notice] = "Deleted #{@course.name}"
  	@course.destroy
  	redirect_to courses_path
  end


  private
  	def course_params
  		params.require(:course).permit(:name)
	 end

    def find_course
      @course = Course.find(params[:id])
    end

end
