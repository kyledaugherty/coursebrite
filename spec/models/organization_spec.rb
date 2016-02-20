require "rails_helper"

describe Organization do
  it { should have_many(:memberships) }
  it { should have_many(:members).through(:memberships) }
  it { should validate_presence_of(:login) }

  describe "before_save" do
    it "should downcase login" do
      organization = build(:organization, login: "FOO")

      organization.save

      expect(organization.login).to eq "foo"
    end
  end
end
