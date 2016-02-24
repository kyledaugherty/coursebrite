module MockAuthorizationPolicyHelpers
  def mock_authorization_policy(policy_class, permission, permitted = true)
    double(policy_class, permission.to_sym => permitted).tap do |policy|
      allow(policy_class).to receive(:new).and_return(policy)
    end
  end
end
