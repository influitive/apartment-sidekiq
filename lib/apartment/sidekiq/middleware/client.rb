module Apartment::Sidekiq::Middleware
  class Client
    def call(worker_class, item, queue, redis_pool=nil)
      item["apartment"] ||= Apartment::Database.current
      yield
    end
  end
end