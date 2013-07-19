module Apartment::Sidekiq
  class Railtie < Rails::Railtie
    initializer "apartment.sidekiq" do
      Apartment::Sidekiq::Middleware.run
    end
  end
end
