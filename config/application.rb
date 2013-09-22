require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TripsApp
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :mini_test, spec: true, feature: false
    end

  end
end
