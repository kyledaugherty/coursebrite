require "rails_helper"

feature "User unpublishes course" do
  scenario "from course dashboard page" do
    user = create(:user)
    course = create(:course)
    course.publish!

    login_as(user)
    visit course_dashboard_path(course)
    click_link("Unpublish")

    expect(page).to have_content("Course was unpublished successfully")
    expect(page).to have_content("Make Course Live")
  end
end
