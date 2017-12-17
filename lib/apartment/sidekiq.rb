require 'apartment/sidekiq/version'
require 'sidekiq'

require 'apartment/sidekiq/middleware/client'
require 'apartment/sidekiq/middleware/server'

module Apartment
  module Sidekiq
    module Middleware

      def self.run
        ::Sidekiq.configure_client do |config|
          config.client_middleware do |chain|
            chain.add ::Apartment::Sidekiq::Middleware::Client
          end
        end

        ::Sidekiq.configure_server do |config|
          config.client_middleware do |chain|
            chain.add ::Apartment::Sidekiq::Middleware::Client
          end

          config.server_middleware do |chain|
            if defined?(::Sidekiq::Batch::Server)
              chain.insert_before ::Sidekiq::Batch::Server, ::Apartment::Sidekiq::Middleware::Server
            else
              chain.add ::Apartment::Sidekiq::Middleware::Server
            end
          end
        end
      end
    end
  end
end

require 'apartment/sidekiq/railtie' if defined?(Rails)
