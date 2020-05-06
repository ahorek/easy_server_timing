# EasyServerTiming
based on https://github.com/rails/rails/pull/36289

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_server_timing'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install easy_server_timing

## Usage
options
```ruby
Rails.application.configure do
  config.easy_server_timing.enabled = true
  config.easy_server_timing.rails_environments = ['development']
  config.easy_server_timing.notification_pattern = /.*/
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
