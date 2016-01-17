class CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @course = Course.new
  end

  def create
    @course = build_course
    if @course.save
      redirect_to course_path(@course), 
        flash: { success: "Course was created successfully." }
    else
      render :new
    end
  end

  def show
    @course = find_course
  end

  private

  def build_course
    Course.new(course_params)
  end

  def course_params
    params.require(:course).permit(:title)
  end

  def find_course
    Course.find(params[:id])
  end
end
