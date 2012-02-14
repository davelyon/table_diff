# Table Diff

A simple library for use in testing to compare an actual and expected table. Compatible with Cucumber, Rspec, and Turnip

## Tables

A table is essentially an array of arrays. Cucumber and Turnip both provide table classes that should be compatible with this library.

A sample table:

	[
	  [ "Name", "Age", "Height" ], # The first 'row' will be used as headers
	  [ "Dave", "99" , " 999cm" ],
	  [ "Andy", "99" , " 999cm" ]
	]

This would be printed as:

	| Name | Age | Height |
	| Dave | 99  | 999cm  |
	| Andy | 99  | 999cm  |

## Usage

	TableDiff::CompareTables.compare(actual, expected).should_not be_different

## Forthcoming

* Should handle extra rows
* Should handle extra columns

## Installation

Add this line to your application's Gemfile:

    gem 'table_diff'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install table_diff

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
