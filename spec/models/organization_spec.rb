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

  describe "#add_member_with_role" do
    it "adds the specified user as a member" do
      organization = create(:organization)
      user = create(:user)

      organization.add_member_with_role(user, :member)

      expect(organization.members).to include user
    end

    it "grants the specified role" do
      organization = create(:organization)
      user = create(:user)

      organization.add_member_with_role(user, :member)

      expect(user.has_role?(:member, organization)).to eq true
    end
  end
end
