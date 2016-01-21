class CourseDashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    course = Course.find(params[:course_id])
    @dashboard = CourseDashboard.new(course)
  end
end
