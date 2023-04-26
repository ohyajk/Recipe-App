# spec/rails_helper.rb
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# Add any additional configuration you need for RSpec or Rails

RSpec.configure do |config|
  # Additional configuration options
end
