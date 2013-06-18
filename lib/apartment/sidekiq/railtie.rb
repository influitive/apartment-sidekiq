module Apartment::Sidekiq
  class Railtie < Rails::Railtie
    initializer "apartment.sidekiq" do
      require 'sidekiq'

      Sidekiq.configure_client do |config|
        config.client_middleware do |chain|
          chain.add Apartment::Sidekiq::Middleware::Client
        end
      end

      Sidekiq.configure_server do |config|
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