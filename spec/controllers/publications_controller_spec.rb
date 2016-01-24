require "rails_helper"

include StubCurrentUserHelpers

describe PublicationsController do
  describe "POST #create" do
    context "when logged out" do
      it { requires_signed_in_user_to { post :create, course_id: 1 } }
    end

    context "when logged in" do
      it "publishes the course" do
        course = create(:course)
        user = mock_model("User")
        stub_current_user_with(user)

        post :create, course_id: course

        expect(course.reload.published?).to be true
      end

      it "redirects to the course dashboard page" do
        course = create(:course)
        user = mock_model("User")
        stub_current_user_with(user)

        post :create, course_id: course

        expect(response).to redirect_to(course_dashboard_path(course))
      end

      it "sets the flash success" do
        course = create(:course)
        user = mock_model("User")
        stub_current_user_with(user)

        post :create, course_id: course

        expect(flash[:success]).to include "published successfully"
      end
    end
  end

  describe "DELETE #destroy" do
    context "when logged out" do
      it { requires_signed_in_user_to { post :create, course_id: 1 } }
    end

    context "when logged in" do
      it "unpublishes the course" do
        course = create(:course)
        user = mock_model("User")
        stub_current_user_with(user)

        delete :destroy, course_id: course

        expect(course.reload.published?).to be false
      end

      it "redirects to the course dashboard page" do
        course = create(:course)
        user = mock_model("User")
        stub_current_user_with(user)

        delete :destroy, course_id: course

        expect(response).to redirect_to(course_dashboard_path(course))
      end

      it "sets the flash success" do
        course = create(:course)
        user = mock_model("User")
        stub_current_user_with(user)

        delete :destroy, course_id: course

        expect(flash[:success]).to include "unpublished successfully"
      end
    end
  end
end
