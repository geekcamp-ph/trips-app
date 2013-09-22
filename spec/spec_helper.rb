require 'capybara'
require 'capybara/dsl'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require_relative '../app'

def app
  Rack::Builder.parse_file(::File.join('./', 'config.ru')).first
end

class MiniTest::Spec
  include Capybara::DSL

  class << self
    alias_method :context, :describe
  end

end

Capybara.app = app
