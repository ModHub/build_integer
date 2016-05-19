[![Build Status](https://travis-ci.org/ModHub/build_integer.svg?branch=master)](https://travis-ci.org/ModHub/build_integer) [![Gem Version](https://badge.fury.io/rb/build_integer.svg)](https://badge.fury.io/rb/build_integer)
# BuildInteger

Tracks the current build count with a .build-number file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'build_integer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install build_integer

## Usage

```ruby
  # start
  BuildInteger.find # finds or creates a .build-number file and returns the current build number
  # > 10
  BuildInteger.increment # increases the number by 1
  # > 11
  BuildInteger.decrement # decreases the number by 1
  # > 10
  BuildInteger.set 5 # set the build number to 5
  # > 5
  BuildInteger.current # returns the current build number
  # > 5
  BuildInteger.reset # sets the build number to 10
  # > 0

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork repository
2. Make your changes
3. write some tests
4. Send a PR

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
