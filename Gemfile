source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.7", ">= 7.0.7.2"

gem "bcrypt", "~> 3.1.7"
gem "blueprinter"
gem "bootsnap", require: false
gem "jwt"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "validates_timeliness", "~> 7.0.0.beta1"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "factory_bot_rails"
  gem "faker"
  gem "guard-rspec"
  gem "rspec-rails"
end

gem "dockerfile-rails", ">= 1.5", group: :development
gem "redis", "~> 5.0"
gem "sentry-ruby",  "~> 5.11"
gem "sentry-rails", "~> 5.11"
