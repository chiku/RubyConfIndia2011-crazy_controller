ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require File.expand_path('test/factories')
require File.expand_path('test/matchers/error_response_matcher')

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  def unprocessable_entity
    422
  end
  
  def created
    201
  end
end
