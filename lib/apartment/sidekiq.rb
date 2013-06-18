require "apartment/sidekiq/version"

module Apartment
  module Sidekiq
    module Middleware
      autoload :Client, 'apartment/sidekiq/middleware/client'
      autoload :Server, 'apartment/sidekiq/middleware/server'
    end
  end
end

require 'apartment/sidekiq/railtie' if defined?(Rails)