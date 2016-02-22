source "https://rubygems.org"

ruby "2.3.0"

gem "airbrake"
gem "autoprefixer-rails"
gem "bootstrap-sass", "~> 3.3.6"
gem "coffee-rails", "~> 4.1.0"
gem "delayed_job_active_record"
gem "devise", "~> 3.5.0"
gem "flutie"
gem "high_voltage"
gem "jquery-rails"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "pundit", "~> 1.1"
gem "rack-canonical-host"
gem "rails", "~> 4.2.0"
gem "recipient_interceptor"
gem "rolify", "~> 5.0"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "title"
gem "uglifier"

group :development do
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-activemodel-mocks", "~> 1.0"
  gem "rspec-rails", "~> 3.4.0"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
