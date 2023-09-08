require 'json_web_token'

Rails.application.config.generators do |generator|
  generator.helper          false
  generator.routing_specs   false
end