# Table Diff

An api for determining the difference between two tables, if any exist.

## Installation

Add this line to your application's Gemfile:

    gem 'tablediff'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tablediff

## Usage

	actual = get_table('foo') # Some sort of method that returns an array of arrays
	expected = table

	differences = TableCompare.compare(actual, expected)

	differences.should be_same_tables

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
