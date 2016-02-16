class OrganizationDashboard
  attr_reader :organization

  delegate :login, to: :organization, prefix: true

  def initialize(organization)
    @organization = organization
  end
end
