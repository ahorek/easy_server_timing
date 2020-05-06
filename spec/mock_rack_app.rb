# frozen_string_literal: true

class MockRackApp
  attr_reader :request_body

  def initialize
    @request_headers = {}
  end

  def call(env)
    @env = env
    @request_body = env['rack.input'].read
    ActiveSupport::Notifications.instrument('sleep') do
      sleep 0.5
    end
    [200, { 'Content-Type' => 'text/plain' }, ['OK']]
  end

  def [](key)
    @env[key]
  end

  def keys
    @env.keys
  end
end