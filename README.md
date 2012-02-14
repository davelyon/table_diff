# Table Diff

A simple library for use in testing to compare an actual and expected table. Compatible with Cucumber, Rspec, and Turnip

## Installation

Add this line to your application's Gemfile:

    gem 'tablediff'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tablediff

## Usage

	TableDiff::CompareTables.compare(actual, expected)

## Forthcoming

* Should handle extra rows
* Should handle extra columns

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
