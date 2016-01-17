require "rails_helper"

describe CoursesController do
  describe "GET #new" do
    it "assigns a new course as @course" do
      get :new

      expect(assigns(:course)).to be_new_record
    end

    it "renders the new template" do
      get :new

      expect(response).to render_template(:new)
    end

    it "responds successfully with 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new course" do
        expect{
          post :create, course: attributes_for(:course)
        }.to change(Course, :count).by(1)
      end

      it "sets the flash success" do
        post :create, course: attributes_for(:course)

        expect(flash[:success]).to include "created successfully"
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested course as @course" do
      course = create(:course)
      get :show, id: course

      expect(assigns(:course)).to eq(course)
    end

    it "renders the show template" do
      course = create(:course)
      get :show, id: course

      expect(response).to render_template(:show)
    end

    it "responds successfully with 200 status code" do
      course = create(:course)
      get :show, id: course

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
