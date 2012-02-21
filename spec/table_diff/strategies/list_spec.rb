require 'spec_helper'

describe TableDiff::Strategies::List do
  let(:expected_table_raw) do
    [
      [ "Dave" ],
      [ "Brian"],
      [ "Josh" ]
    ]
  end

  let(:expected_table) do
    TableDiff::Table.new(expected_table_raw)
  end

  let(:expected) do
    TableDiff::ComparableTable.new(expected_table)
  end

  subject do
    described_class.new(actual, expected)
  end

  context "lists are the same" do
    let(:actual) { expected }

    it "returns the actual table" do
      subject.diff.should == actual
    end
  end

end
