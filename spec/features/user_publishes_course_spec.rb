require "rails_helper"

feature "User publishes course" do
  scenario "from course dashboard page" do
    user = create(:user)
    course = create(:course)

    login_as(user)
    visit course_dashboard_path(course)
    click_link("Make Course Live")

    expect(page).to have_content("Course was published successfully")
    expect(page).to have_content("Unpublish")
  end
end
