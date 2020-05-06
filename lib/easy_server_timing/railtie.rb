# frozen_string_literal: true

module EasyServerTiming
  class Railtie < Rails::Railtie
    initializer "easy_server_timing.configure_rails_initialization" do |app|
      if correct_environment?(app) && app.config.easy_server_timing.enabled
        EasyServerTiming.notification_pattern = app.config.easy_server_timing.notification_pattern
        
        app.middleware.use EasyServerTiming::Middleware
      end
    end

    def correct_environment?(app)
      if app.config.easy_server_timing.rails_environments
        app.config.easy_server_timing.rails_environments.include?(Rails.env.to_s)
      else
        true
      end
    end

    config.easy_server_timing = ActiveSupport::OrderedOptions.new
    config.easy_server_timing.enabled = true
    config.easy_server_timing.notification_pattern = EasyServerTiming.notification_pattern
    config.easy_server_timing.rails_environments = nil
  end
end