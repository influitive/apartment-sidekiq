module Sidekiq
  module JobApartmentExtensions
    def display_class
      [@item['apartment'], super.to_s].reject(&:blank?).join(': ')
    end
  end

  class Job
    prepend JobApartmentExtensions
  end
end
