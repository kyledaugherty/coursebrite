require "rails_helper"

describe OrganizationDashboardPolicy do
  subject { described_class }

  permissions :show? do
    it "denies access for non-members" do
      user = build(:user)
      dashboard = build(:organization_dashboard)

      expect(subject).not_to permit(user, dashboard)
    end

    it "denies access for ordinary members" do
      user = build(:user)
      dashboard = build(:organization_dashboard)
      user.add_role :member, dashboard.organization

      expect(subject).not_to permit(user, dashboard)
    end

    it "grants access for managers" do
      user = build(:user)
      dashboard = build(:organization_dashboard)
      user.add_role :manager, dashboard.organization

      expect(subject).to permit(user, dashboard)
    end

    it "grants access for admins" do
      user = build(:user)
      dashboard = build(:organization_dashboard)
      user.add_role :admin

      expect(subject).to permit(user, dashboard)
    end
  end
end
