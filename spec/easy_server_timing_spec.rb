# frozen_string_literal: true

RSpec.describe EasyServerTiming::Middleware do

  let(:app) { MockRackApp.new }
  subject { described_class.new(app) }

  it "has a version number" do
    expect(EasyServerTiming::VERSION).not_to be nil
  end

  context "test request" do
    let(:request) { Rack::MockRequest.new(subject) }

    it "includes server timing headers" do
      response = request.get("/", 'CONTENT_TYPE' => 'text/plain')
      expect(response.headers["Server-Timing"]).to match(/sleep;dur=500.\d*/)
    end
  end
end