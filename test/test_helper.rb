ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "factory_girl"
require "minitest/rails"
require "minitest/rails/capybara"
require "rails/test_help"
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
class MiniTest::Spec
  before :each do
    DatabaseCleaner.clean
  end
end

Dir["./test/factories/*.rb"].each {|file| require file }

class ActiveSupport::TestCase
  fixtures :all
  include FactoryGirl::Syntax::Methods
end
