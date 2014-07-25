source 'https://rubygems.org'

ruby '2.1.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
# Forms generator
gem 'simple_form', '~>3.1.0.rc1'
# Users
gem 'devise'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc
# Admin panel
gem 'activeadmin', github: 'gregbell/active_admin'
# Sending sms via sms.ru
gem 'smsru', github: 'avaelkross/smsru'
# Settings
gem "rails-settings-cached", "0.4.1"
# Delayed jobs
gem 'delayed_job_active_record'
gem "daemons"
gem "delayed_job_web"

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Deploy
  gem 'mina'
  # Keep DB table info in model
  gem 'annotate', ">=2.6.0"
end

group :production do
  gem 'unicorn'
  gem 'archive-zip'
end

group :test do
  gem "rspec"
  gem 'shoulda-matchers'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

