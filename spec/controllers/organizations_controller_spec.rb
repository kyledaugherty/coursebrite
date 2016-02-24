require "rails_helper"

include StubCurrentUserHelpers

describe OrganizationsController do
  describe "GET #new" do
    context "when a logged out user requests it" do
      it { requires_signed_in_user_to { get :new } }
    end

    context "when a logged in user requests it" do
      it "assigns a new organization as @organization" do
        user = mock_model("User")
        stub_current_user_with(user)

        get :new

        expect(assigns(:organization)).to be_new_record
      end

      it "renders the new template" do
        user = mock_model("User")
        stub_current_user_with(user)

        get :new

        expect(response).to render_template(:new)
      end

      it "responds successfully with 200 status code" do
        user = mock_model("User")
        stub_current_user_with(user)

        get :new

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    context "when logged out" do
      it { requires_signed_in_user_to { post :create, attributes_for(:organization) } }
    end

    context "when logged in" do
      context "with valid params" do
        it "creates a new organization for the current user" do
          user = create(:user)
          sign_in user

          expect do
            post :create, organization: attributes_for(:organization)
          end.to change(user.organizations, :count).by(1)
        end

        it "makes the current user the default admin" do
          user = create(:user)
          sign_in user

          post :create, organization: attributes_for(:organization)

          expect(user.has_role?(:admin, Organization.last)).to eq true
        end

        it "redirects to the organization dashboard page" do
          user = create(:user)
          sign_in user

          post :create, organization: attributes_for(:organization)

          expect(response).to redirect_to(
            organization_dashboard_path(user.organizations.last)
          )
        end

        it "sets the flash success" do
          user = create(:user)
          sign_in user

          post :create, organization: attributes_for(:organization)

          expect(flash[:success]).to include "created successfully"
        end
      end
    end
  end
end
