class OrganizationDashboardPolicy < ApplicationPolicy
  def initialize(user, dashboard)
    @user = user
    @dashboard = dashboard
  end

  def show?
    can_read?
  end

  private

  attr_reader :user, :dashboard

  def admin?
    user.has_role?(:admin) || user.has_role?(:admin, dashboard.organization)
  end

  def manager?
    user.has_role? :manager, dashboard.organization
  end

  def can_read?
    admin? || manager?
  end
end
