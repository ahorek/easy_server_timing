# frozen_string_literal: true

module EasyServerTiming
  def self.notification_pattern
    @notification_pattern || /^(?!request).*$/
  end

  def self.notification_pattern=(pattern)
    @notification_pattern = pattern
  end

  def self.rails?
    defined? Rails::Railtie
  end
end

require "easy_server_timing/version"
require "easy_server_timing/middleware"
require "easy_server_timing/railtie" if EasyServerTiming.rails?
