source 'https://rubygems.org'

ruby '2.3.1'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'awesome_rails_console'
gem 'bootstrap-sass'
gem 'devise'
gem 'simple_form'
gem 'font-awesome-rails'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick'
gem 'airbrake'
gem 'will_paginate-bootstrap'
gem 'letter_opener', group: :development
gem 'aasm'
gem 'figaro'
gem 'fog'
gem 'acts_as_votable'
gem 'bullet', group: 'development'
gem 'newrelic_rpm'
gem 'masonry-rails'
gem 'social-share-button'
gem 'therubyracer'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'paperclip', '~> 4.1'
gem 'searchkick'
gem 'jquery-ui-rails'
gem "rails-erd"
gem 'mailboxer'
gem 'chosen-rails'
# gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'
gem 'seo_helper'
gem 'sitemap_generator'
gem 'md_simple_editor'
gem 'redcarpet'
gem 'coderay'
gem 'rails-i18n'
gem 'devise-i18n'
gem 'faker'
gem 'ransack'
gem "select2-rails"
gem 'paper_trail'
gem 'premailer-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'brakeman', :require => false
  gem 'rubycritic', :require => false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'pg'
end

gem 'rack-mini-profiler', require: false
