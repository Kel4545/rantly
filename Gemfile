source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'paperclip', '3.5'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'bcrypt', '~> 3.1.7'
gem "launchy"
gem 'redcarpet'
gem 'keen'
gem 'aws-sdk'


group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
end

group :test, :development do
  gem "rspec-rails", "3.0.1"
  gem 'rspec-collection_matchers', '~> 1.0.0'
  gem "capybara", "2.3.0"
  gem "pry-rails"
  gem "pry-byebug"
  gem "selenium-webdriver"
  gem "font-awesome-rails"
  gem "database_cleaner"
end

group :production, :staging do
  gem 'rails_12factor'
end
