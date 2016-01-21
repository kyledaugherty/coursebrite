module ActionRequiresSignInHelpers
  def requires_signed_in_user_to
    yield

    expect(response).to redirect_to(new_user_session_path)
  end
end
