require 'spec_helper'

describe TableDiff::Strategies::Differentiator do
  let(:expected_table_raw) do
    [
      [ "Name"  ,  "Age" ,  "Height"],
      [ "Dave"  ,  "96"  ,  "6-6"],
      [ "Brian" ,  "97"  ,  "6-7"],
      [ "Josh"  ,  "98"  ,  "6-3"]
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

  context "tables are the same" do
    let(:actual) { expected }

    it "returns the actual table" do
      subject.diff.should == actual
    end
  end

  context "table headers do not match" do
    let(:actual_table_raw) do
      [
        [ "Name"  ,  "Age" ,  "Weight"],
        [ "Dave"  ,  "96"  ,  "6-6"],
        [ "Brian" ,  "97"  ,  "6-7"],
        [ "Josh"  ,  "98"  ,  "6-3"]
      ]
    end
    let(:actual_table) do
      TableDiff::Table.new(actual_table_raw)
    end
    let(:actual) do
      TableDiff::ComparableTable.new(actual_table)
    end

    it "raises DifferentHeaders" do
      expect do
        subject.diff
      end.to raise_error TableDiff::DifferentHeaders
    end
  end

  context "tables are different" do
    let(:actual_table_raw) do
      [
        [ "Name"  ,  "Age" ,  "Height"],
        [ "OoOoO" ,  "96"  ,  "6-6"],
        [ "Brian" ,  "97"  ,  "6-7"],
        [ "Josh"  ,  "98"  ,  "6-3"]
      ]
    end
    let(:actual_table) do
      TableDiff::Table.new(actual_table_raw)
    end
    let(:actual) do
      TableDiff::ComparableTable.new(actual_table)
    end

    it "raises DifferentHeaders" do
      expect do
        subject.diff
      end.to raise_error TableDiff::DifferentTables
    end
  end
end
