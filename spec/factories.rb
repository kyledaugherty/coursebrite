FactoryGirl.define do
  sequence(:email) { |n| "user-#{n}@example.com" }

  factory :course do
    title "A title"
  end

  factory :organization do
    login "foobar"
  end

  factory :organization_dashboard do
    organization

    initialize_with { new(organization) }
  end

  factory :role do
    name "default"
  end

  factory :user do
    email
    password "password123"

    factory :admin do
      after :create do |instance|
        instance.roles << create(
          :role,
          name: "admin"
        )
      end
    end

    factory :organization_admin do
      after :create do |instance|
        organization = create(:organization)
        instance.organizations << organization
        instance.roles << create(
          :role,
          name: "admin",
          resource: organization
        )
      end
    end

    factory :organization_manager do
      after :create do |instance|
        organization = create(:organization)
        instance.organizations << organization
        instance.roles << create(
          :role,
          name: "manager",
          resource: organization
        )
      end
    end
  end
end
