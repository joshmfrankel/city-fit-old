source 'https://rubygems.org'

gem 'rails', '4.2.0.rc1'
gem 'sass-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '4.0.1'
gem 'turbolinks', '2.5.3'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Bootstrap
gem 'bootstrap-sass', '3.3.3'

# Has_secure_password
gem 'bcrypt', '3.1.10'

# Api
gem 'indeed-ruby', '0.0.1'

group :development, :test do
  gem 'sqlite3', '1.3.10'
  gem 'byebug', '3.5.1'
  gem 'web-console', '2.0.0'
end

group :test do
  gem 'minitest-reporters', '1.0.10'
  gem 'mini_backtrace',     '0.1.3'
  gem 'libnotify',          '0.9.1'  # Notifications
  gem 'guard',              '2.11.1' # Guard to use libnotify properly
  gem 'guard-minitest',     '2.4.3'
  gem 'spring',             '1.2.0' # spring server
end

# Heroku gems
group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'unicorn',        '4.8.3'
end
