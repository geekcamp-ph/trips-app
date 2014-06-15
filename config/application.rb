require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require 'rake/testtask'
require "action_mailer/railtie"
require "sprockets/railtie"
require "minitest/rails/railtie" if Rails.env.test?

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TripsApp
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :mini_test, spec: true, fixture: false
      g.helper false
      g.assets false
      g.view_specs false
    end

  end
end
