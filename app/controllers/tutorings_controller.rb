class TutoringsController < ApplicationController
before_action :find_tutoring, only: [:show, :edit, :update, :destroy]

  def index
  	@tutorings = Tutoring.where(:user_id => current_user.id)
    @user = User.where(:id => current_user.id)
  end

  def new
  	@tutoring = Tutoring.new()
  end

  def create
   	@tutoring = Tutoring.new(tutoring_params)
    @tutoring.user_id = current_user.id
    if @tutoring.save
      flash[:notice] = "Successfully added course"
      redirect_to tutorings_path
    else
      flash[:notice] = "Course not added. Please double-check your input."
 	    render 'new'
    end
  end

  def edit

  end

  def update
    if @tutoring.update(tutoring_params)
      flash[:notice] = "Information updated"
      redirect_to tutorings_path
    else
      flash[:notice] = "Failed to update"
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = "Deleted #{@tutoring.course}"
  	@tutoring.destroy
  	redirect_to tutorings_path
  end

  def list
    @tutorings = Tutoring.where(:course_id => params[:course])
    @course = Course.find(params[:course])
  end

  private
  	def tutoring_params
  		params.require(:tutoring).permit(:user_id, :course_id, :hourly, :mode, :description)
	  end

    def find_tutoring
      @tutoring = Tutoring.find(params[:id])
    end


end
