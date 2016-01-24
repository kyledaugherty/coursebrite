class PublicationsController < ApplicationController
  before_action :authenticate_user!

  def create
    course = find_course
    course.publish!
    redirect_to course_dashboard_path(course),
                flash: { success: "Course was published successfully." }
  end

  def destroy
    course = find_course
    course.unpublish!
    redirect_to course_dashboard_path(course),
                flash: { success: "Course was unpublished successfully." }
  end

  private

  def find_course
    Course.find(params[:course_id])
  end
end
