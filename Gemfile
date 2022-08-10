source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 7.0.2", ">= 7.0.2.3"

gem "font-awesome-rails"
gem 'rails-i18n', '~> 7.0.0'

gem 'friendly_id', '~> 5.4.0'
gem 'gravtastic', '~> 3.2.6'

gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"

gem 'securerandom'

gem 'mailjet'

gem "bootsnap", require: false

group :development, :test do
  gem "letter_opener", "~> 1.8.1"
  gem "sqlite3", "~> 1.4"

  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :production do
  gem "puma", "~> 5.0"
  gem "pg"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
