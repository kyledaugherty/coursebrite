class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @organization = Organization.new
  end

  def create
    @organization = build_organization
    if @organization.save
      current_user.organizations << @organization
      redirect_to organization_dashboard_path(@organization),
                  flash: { success: "Organization was created successfully." }
    else
      render :new
    end
  end

  private

  def build_organization
    Organization.new(organization_params)
  end

  def organization_params
    params.require(:organization).permit(:login)
  end
end
