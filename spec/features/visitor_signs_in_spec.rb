require "rails_helper"

feature "Visitor signs in" do
  scenario "with valid credentials" do
    user = create(:user, email: "user@example.com", password: "password")
    sign_in_with(user.email, user.password)

    expect_user_to_be_signed_in
  end

  scenario "with invalid email" do
    sign_in_with("unknown.email@example.com", "password")

    expect_page_to_display_sign_in_error
    expect_user_to_be_signed_out
  end

  scenario "with invalid password" do
    user = create(:user, password: "password")
    sign_in_with(user.email, "wrong_password")

    expect_page_to_display_sign_in_error
    expect_user_to_be_signed_out
  end

  def expect_page_to_display_sign_in_error
    expect(page.body).to include(
      t("sessions.flashes.failure_after_create")
    )
  end
end
