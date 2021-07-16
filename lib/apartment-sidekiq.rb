require 'apartment/sidekiq'
require 'sidekiq/enterprise/unique' if Sidekiq.const_defined?(:Enterprise)
require 'sidekiq/job'
