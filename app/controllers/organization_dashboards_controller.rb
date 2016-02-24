class OrganizationDashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    organization = Organization.find(params[:organization_id])
    @dashboard = OrganizationDashboard.new(organization)
    authorize @dashboard
  end
end
