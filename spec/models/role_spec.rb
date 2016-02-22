require "rails_helper"

describe Role do
  it { should belong_to(:resource) }
  it { should have_and_belong_to_many(:users).join_table("users_roles") }
  it do
    should validate_inclusion_of(:resource_type).
      in_array(Rolify.resource_types)
  end
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:resource_id) }
  it { should validate_presence_of(:resource_type) }
end
