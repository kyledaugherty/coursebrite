require "rails_helper"

include MockAuthorizationPolicyHelpers
include StubCurrentUserHelpers

describe OrganizationDashboardsController do
  describe "GET #show" do
    context "when a logged out user requests it" do
      it { requires_signed_in_user_to { get :show, organization_id: 1 } }
    end

    context "when a logged in user requests it" do
      it "assigns @dashboard" do
        user = mock_model("User")
        stub_current_user_with(user)
        organization = create(:organization)
        mock_authorization_policy(OrganizationDashboardPolicy, :show?)

        get :show, organization_id: organization

        expect(assigns(:dashboard)).to_not be_nil
      end

      it "renders the show template" do
        user = mock_model("User")
        stub_current_user_with(user)
        organization = create(:organization)
        mock_authorization_policy(OrganizationDashboardPolicy, :show?)

        get :show, organization_id: organization

        expect(response).to render_template(:show)
      end

      it "responds successfully with 200 status code" do
        user = mock_model("User")
        stub_current_user_with(user)
        organization = create(:organization)
        mock_authorization_policy(OrganizationDashboardPolicy, :show?)

        get :show, organization_id: organization

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end
end
