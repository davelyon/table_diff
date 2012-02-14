require 'spec_helper'

describe Tablediff::Row do
  let(:row_hash) do
    { "Name" => "Dave", "Number" => 11 }
  end
  let(:row) { described_class.new( row_hash ) }

  it "keeps the raw row hash" do
    row.raw.should == row_hash
  end

  describe "#diff" do
    context "when there are no differences" do
      let(:expected_row) { described_class.new(row_hash) }
      it "returns self" do
        row.diff(expected_row).should == row
      end
    end

    context "when there are differences" do
      let(:expected_row) { described_class.new(row_hash.merge("Name" => "Bob")) }
      it "returns an instance of RowWithDifferences" do
        row.diff(expected_row).should be_a Tablediff::RowWithDifferences
      end
    end
  end

  describe "#different?" do
    subject { row }
    it { should_not be_different }
  end

  describe "#widths" do
    subject { row.widths }
    it { should == [ 4, 2 ] }
  end
end
