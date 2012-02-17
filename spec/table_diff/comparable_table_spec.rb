require 'spec_helper'

describe TableDiff::ComparableTable do

  let(:table) { stub( :hashes => [{"foo" => "bar"}, {"baz" => "xlerb"}], :headers => {"foo" => "foo"}) }
  let(:comparable_table) { described_class.new(table) }

  describe "#rows" do
    subject { comparable_table.rows }
    it "is a collection of Rows" do
      should(satisfy do |rows|
        rows.all? { |r| r.is_a? TableDiff::Row }
      end)
    end
  end

  describe "#diff" do
    subject { comparable_table.diff(expected_table) }

    context "when there are no differences" do
      let(:expected_table) { comparable_table }
      it "returns self" do
        should == comparable_table
      end
    end

    context "when there are differences" do
      let(:expected_table) do
        described_class.new( stub( :hashes => [{ "foo" => "bar"}, {"baz" => "nope"}], :headers => table.headers))
      end

      it "raises DifferentTables" do
        expect { subject }.to raise_error TableDiff::DifferentTables
      end
    end

    context "when the number of rows is not equal" do
      let(:expected_table) do
        described_class.new( stub( :hashes => [{"baz" => "nope"}] ) )
      end
      it "raises an error" do
        expect {
          subject
        }.to raise_error TableDiff::MissingRows
      end
    end
  end

  describe "#different?" do
    subject { comparable_table }
    it { should_not be_different }
  end
end
