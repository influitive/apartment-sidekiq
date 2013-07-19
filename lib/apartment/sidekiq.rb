require 'apartment/sidekiq/version'
require 'sidekiq'

module Apartment
  module Sidekiq
    module Middleware
      autoload :Client, 'apartment/sidekiq/middleware/client'
      autoload :Server, 'apartment/sidekiq/middleware/server'

      def self.run
        ::Sidekiq.configure_client do |config|
          config.client_middleware do |chain|
            chain.add Apartment::Sidekiq::Middleware::Client
          end
        end

        ::Sidekiq.configure_server do |config|
          config.client_middleware do |chain|
            chain.add Apartment::Sidekiq::Middleware::Client
          end

          config.server_middleware do |chain|
            chain.add Apartment::Sidekiq::Middleware::Server
          end
        end
      end
    end
  end
end

require 'apartment/sidekiq/railtie' if defined?(Rails)
