class CourseController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
  end
end
