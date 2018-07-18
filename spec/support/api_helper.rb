# module ApiHelper
#   include Rack::Test::Methods

#   def app
#     Rails.application
#   end
# end

# RSpec.configure do |config|
#   config.include ApiHelper, :type => :api # apply to all specs inside api/
# end

module Requesthelpers
  def parsed_response
    @parsed_response ||= JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include Requesthelpers
end
