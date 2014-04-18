require "active_support"

module Various
  module Controller
    extend ActiveSupport::Concern

    included do
      before_action :detect_device_variant
    end

    def detect_device_variant
      Various.configuration.variant_map.each do |key, value|
        if request.user_agent =~ key
          request.variant = value
          return
        end
      end
    end
  end
end
