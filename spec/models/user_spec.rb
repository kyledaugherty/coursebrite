require "rails_helper"

describe User do
  it { should have_many(:memberships).with_foreign_key("member_id") }
  it { should have_many(:organizations).through(:memberships) }
end
