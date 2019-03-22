# Dentaku

simple calculator

## Installation

Add this line to your application's Gemfile:

```ruby
gem "dentaku", :git => "https://github.com/mitubaEX/Dentaku.git" # URI は適宜書き換えてください
```

And then execute:

    $ bundle install

## Usage

```
$ bundle ex bin/dentaku dentaku '20 - 2 * 3 / 4 % 2'
19
$ bundle ex bin/dentaku dentaku '(20 - 2) * 3 / 4 % 2'
1
$ bundle ex bin/dentaku dentaku 'def f(){ 1 } f()'
1
$ bundle ex bin/dentaku dentaku 'def f(){ 1 } f()'
1
$ bundle ex bin/dentaku dentaku 'def f(a){ a + 1 } f(1 + 2)'
4
$ bundle ex bin/dentaku dentaku 'def f(a){ a * 2 } f(f(f(1 + 2)))'
24
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/test.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
