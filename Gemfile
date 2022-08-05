source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "font-awesome-rails"

gem "rails", "~> 7.0.2", ">= 7.0.2.3"

gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"

gem "bootsnap", require: false

group :development, :test do
  gem "puma", "~> 5.0"
  gem "sqlite3", "~> 1.4"

  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :production do
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
