source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails',              '4.0.1'
gem 'pg',                 '~> 0.17.0'
gem 'devise',             '~> 3.1.1'
gem 'omniauth-facebook',  '~> 1.4.1'
gem 'carrierwave',        '~> 0.9.0'
gem 'uglifier',           '>= 1.3.0'
gem 'jquery-rails',       '~> 3.0.4'
gem 'turbolinks',         '~> 1.3.0'
gem 'pagarme',            '~> 0.15'
gem 'unicorn',            '~> 4.7.0'
gem 'sass-rails',         '~> 4.0.1'
gem 'prawn',              '~> 0.12.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  # Gem to improve error displaying in Rails
  # *cannot* be used in production
  gem 'better_errors', '~> 1.0.1'
end

group :production do
  gem 'rails_12factor', '~> 0.0.2'
end

group :deploy do
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-rails', '~> 1.0.0'
end