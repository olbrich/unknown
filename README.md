# Unknown

Unknown is a class representing a Numeric that is unknown.  By using
this class to represent unknown values instead of nil it is possible to
avoid doing nil checks in your functions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unknown'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unknown

## Usage

Before using Unknown


    def population(a,k,t)
      fail "a is missing" unless a
      fail "k is missing" unless k
      fail "t is missing" unless t
      a*Math.exp(-k*t)
    end

    population(20, 30, nil) #=> Exception "t is missing"

When using Unknown

    require 'unknown'

    def population(a,k,t)
      a*Math.exp(-k*t)
    end

    population(20,30,Unknown) # => Unknown


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/unknown/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
