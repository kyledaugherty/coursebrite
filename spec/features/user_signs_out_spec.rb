require "rails_helper"

feature "User signs out" do
  scenario "successfully" do
    user = create(:user)
    sign_in_with(user.email, user.password)
    sign_out

    expect_user_to_be_signed_out
  end
end
