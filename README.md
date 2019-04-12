# Parallel::Sauce

This is a small gem that allows you to trigger sauce labs `xcuitest` runs in parallel 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parallel-sauce'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parallel-sauce

## Usage

Usage is pretty straight forward
    
    require 'parallel/sauce'
    
    runner = Parallel::Sauce::Runner.new(4, 'path/to/runner.jar', 'sauce_api_key')
    runner.run('path/to/main/app', ['path/to/runner_app_1.app', 'path/to/runner_app_2.app'], 'path/to/result/folder')
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/slavkokrucaj/parallel-sauce. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Parallel::Sauce project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/slavkokrucaj/parallel-sauce/blob/master/CODE_OF_CONDUCT.md).
