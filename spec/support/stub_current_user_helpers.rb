module StubCurrentUserHelpers
  def stub_current_user_with(user)
    allow(controller).to(receive(:authenticate_user!))
    allow(controller).to(receive(:current_user).and_return(user))
  end
end
