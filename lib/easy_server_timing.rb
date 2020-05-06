# frozen_string_literal: true

module EasyServerTiming
  cattr_accessor :notification_pattern
  self.notification_pattern = /^(?!request).*$/

  def self.rails?
    defined? Rails::Railtie
  end
end

require "easy_server_timing/version"
require "easy_server_timing/middleware"
require "easy_server_timing/railtie" if EasyServerTiming.rails?
