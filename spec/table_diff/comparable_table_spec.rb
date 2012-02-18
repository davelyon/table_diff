require 'spec_helper'

describe TableDiff::ComparableTable do

  let(:table) do
    TableDiff::Table.new([
      ["A", "B", "C"],
      ["1", "2", "3"],
      ["4", "5", "6"]
    ])
  end

  let(:comparable_table) { described_class.new table }

  describe "#rows" do
    subject { comparable_table.rows }
    it "is a collection of Rows" do
      should(satisfy do |rows|
        rows.all? { |r| r.is_a? TableDiff::Row }
      end)
    end
  end

  describe "#with_selected_columns" do
    subject { comparable_table.with_selected_columns("A") }
    it "returns a table with only those columns" do
      subject.headers.should == ["A"]
      subject.table.raw.should == [ ["A"], ["1"], ["4"] ]
    end
  end

  describe "#different?" do
    subject { comparable_table }
    it { should_not be_different }
  end
end
