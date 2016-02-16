require "rails_helper"

feature "User views organization dashboard" do
  scenario "successfully" do
    user = create(:user)
    organization = create(:organization, login: "foobar")

    login_as(user)
    visit organization_dashboard_path(organization)

    expect(page).to have_content("foobar")
  end
end
