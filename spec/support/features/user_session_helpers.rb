module Features
  def expect_user_to_be_signed_in
    expect(page).to have_selector(
      :link_or_button, t("layouts.application.sign_out")
    )
  end

  def expect_user_to_be_signed_out
    expect(page).to have_content t("layouts.application.sign_in")
  end

  def sign_in_with(email, password)
    visit new_user_session_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_button t("sessions.new.sign_in")
  end

  def sign_out
    click_button t("layouts.application.sign_out")
  end
end
