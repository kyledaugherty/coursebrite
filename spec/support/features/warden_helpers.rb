RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.after :each do
    Warden.test_reset!
  end
  config.before :suite do
    Warden.test_mode!
  end
end
