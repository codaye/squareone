# Squareone

[![Gem Version][gem-image]][gem-url] [![Build Status][travis-image]][travis-url] [![Code Climate][codeclimate-image]][codeclimate-url]

__Squareone__ is Jekyll site project generator with Gulp task automation work-flow.

Jekyll is a great tool we use at Codaye but we find ourselves spending a lot of time trying to set it up with Gulp each time we start a new project. We needed a tool to eliminate that initial friction we encounter so we can get straight to implementing our creative ideas.

Squareone is meant to scratch our itch but we made only a few changes to the files Jekyll generates to keep it as generic as possible.


## Installation

install Squareone from RubyGems:

    $ gem install squareone

## Usage

    $ squareone new project-name


## Features
Jekyll + Gulp = Creative Bliss :). Squareone comes with some defined Gulp tasks which you can modify or add to.

- Instant browser reloads as you make file changes.
- node-sass for faster Sass compilation.
- Setup for multiple environment (development/production).


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/codaye/squareone. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[gem-url]: https://badge.fury.io/rb/squareone
[gem-image]: https://badge.fury.io/rb/squareone.svg

[travis-url]: https://travis-ci.org/codaye/squareone
[travis-image]: https://travis-ci.org/codaye/squareone.svg?branch=master

[codeclimate-url]: https://codeclimate.com/github/codaye/squareone
[codeclimate-image]: https://codeclimate.com/github/codaye/squareone/badges/gpa.svg
