require "rails_helper"

feature "User views organization dashboard" do
  context "as an application admin" do
    scenario "successfully" do
      admin = create(:admin)
      organization = create(:organization)

      login_as(admin)
      visit organization_dashboard_path(organization)

      expect(page).to have_content("foobar")
    end
  end

  context "as an organization admin" do
    scenario "successfully" do
      admin = create(:organization_admin)
      organization = admin.organizations.first

      login_as(admin)
      visit organization_dashboard_path(organization)

      expect(page).to have_content("foobar")
    end
  end

  context "as an organization manager" do
    scenario "successfully" do
      manager = create(:organization_manager)
      organization = manager.organizations.first

      login_as(manager)
      visit organization_dashboard_path(organization)

      expect(page).to have_content("foobar")
    end
  end
end
