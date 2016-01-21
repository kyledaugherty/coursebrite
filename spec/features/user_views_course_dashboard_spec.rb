require "rails_helper"

feature "User views course dashboard" do
  scenario "successfully" do
    user = create(:user)
    course = create(:course, title: "Foo")

    login_as(user)
    visit course_dashboard_path(course)

    expect(page).to have_content("Foo")
  end
end
