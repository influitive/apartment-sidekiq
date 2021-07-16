module Sidekiq
  module Enterprise
    module Unique
      def self.context_for(_worker, job)
        args = job['args']
        args = args[0]['arguments'] if job['class'] == 'ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper'
        [
          job['wrapped'] || job['class'],
          job['queue'],
          args,
          Apartment::Tenant.current
        ]
      end
    end
  end
end
