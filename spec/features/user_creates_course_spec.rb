require "rails_helper"

feature "User creates a course" do
  scenario "successfully" do
    user = create(:user)

    login_as(user)
    visit new_course_path
    create_course_with_title("A new course")

    expect(page).to have_content("A new course")
  end

  def create_course_with_title(title)
    fill_in "Title", with: title
    click_on "Create Course"
  end
end
