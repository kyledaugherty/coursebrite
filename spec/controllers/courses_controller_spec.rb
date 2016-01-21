require "rails_helper"

include StubCurrentUserHelpers

describe CoursesController do
  describe "GET #new" do
    context "when a logged out user requests it" do
      it { requires_signed_in_user_to { get :new } }
    end

    context "when a logged in user requests it" do
      it "assigns a new course as @course" do
        user = mock_model("User")
        stub_current_user_with(user)

        get :new

        expect(assigns(:course)).to be_new_record
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
      it { requires_signed_in_user_to { post :create, attributes_for(:course) } }
    end

    context "when logged in" do
      context "with valid params" do
        it "creates a new course" do
          user = mock_model("User")
          stub_current_user_with(user)

          expect{
            post :create, course: attributes_for(:course)
          }.to change(Course, :count).by(1)
        end

        it "redirects to the course dashboard page" do
          user = mock_model("User")
          stub_current_user_with(user)

          post :create, course: attributes_for(:course)

          expect(response).to redirect_to(course_dashboard_path(Course.last))
        end

        it "sets the flash success" do
          user = mock_model("User")
          stub_current_user_with(user)

          post :create, course: attributes_for(:course)

          expect(flash[:success]).to include "created successfully"
        end
      end
    end
  end

  describe "GET #show" do
    context "when a logged out user requests it" do
      it { requires_signed_in_user_to { get :show, id: 1 } }
    end

    context "when a logged in user requests it" do
      it "assigns the requested course as @course" do
        user = mock_model("User")
        stub_current_user_with(user)
        course = create(:course)
        
        get :show, id: course

        expect(assigns(:course)).to eq(course)
      end

      it "renders the show template" do
        user = mock_model("User")
        stub_current_user_with(user)
        course = create(:course)

        get :show, id: course

        expect(response).to render_template(:show)
      end

      it "responds successfully with 200 status code" do
        user = mock_model("User")
        stub_current_user_with(user)
        course = create(:course)
        
        get :show, id: course

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end
end
