require 'spec_helper'

describe Tablediff::OutputFormatter do
  HEADERS = ["One", "Two", "Tree"]
  Row = Tablediff::Row
  RowWithDifferences = Tablediff::RowWithDifferences
  def row_hash(array)
    Hash[HEADERS.zip(array)]
  end

  let(:rows) do
    actual = Row.new(row_hash ["Dave", "Jon", "Josh"])
    expected = Row.new(row_hash ["Dave", "Brian", "Josh"])
    [
      Row.new(row_hash(HEADERS)),
      Row.new(row_hash ["Foo", "Bar", "Baz"]),
      RowWithDifferences.new( actual, expected)
    ]
  end


  subject { described_class.new(rows) }

  it do
    expected = <<EOS
|  One |         Two | Tree |
|  Foo |         Bar |  Baz |
| Dave | Jon (Brian) | Josh |
EOS
  subject.to_s.should == expected.chomp
  end
end
