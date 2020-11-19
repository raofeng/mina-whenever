# Mina::Whenever

This is a whenever plugin for [mina](https://github.com/mina-deploy/mina)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-whenever-env'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-whenever-env

## Usage

in `deploy.rb`

    require 'mina/whenever'

    task :deploy do
      deploy do
        invoke :'whenever:update'
      end
    end

## Configuration

These are the settings you can set:

    set :whenever_name # default: "#{application_name}_#{rails_env}"

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mina-deploy/mina-whenever. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
