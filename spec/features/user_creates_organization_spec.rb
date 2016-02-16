require "rails_helper"

feature "User creates an organization" do
  scenario "successfully" do
    user = create(:user)

    login_as(user)
    visit new_organization_path
    create_organization_with_login("foobar")

    expect(page).to have_content("foobar")
  end

  def create_organization_with_login(login)
    fill_in "Organization name", with: login
    click_on "Create Organization"
  end
end
