class CourseDashboardsController < ApplicationController
  before_action :authenticate_user!
  after_action :skip_authorization

  def show
    course = Course.find(params[:course_id])
    @dashboard = CourseDashboard.new(course)
  end
end
