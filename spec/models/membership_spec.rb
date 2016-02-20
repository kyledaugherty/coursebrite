require "rails_helper"

describe Membership do
  it { should belong_to(:joinable) }
  it { should belong_to(:member).class_name("User") }
end
