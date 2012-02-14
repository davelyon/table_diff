require 'spec_helper'

describe Tablediff::RowWithDifferences do
  subject { described_class.new nil, nil }
  describe "#different?" do
    it { should be_different }
  end

  describe "printing methods" do
    let(:actual) { Tablediff::Row.new( { "a" => "bee", "d" => "foo"} ) }
    let(:expected) { Tablediff::Row.new( { "a" => "woo", "d" => "foo"} ) }
    describe "#strings" do
      subject { described_class.new(actual, expected).strings }

      it do
        should == [ "bee (woo)", "foo" ]
      end
    end

    describe "#widths" do
      subject { described_class.new(actual, expected).widths }

      it do
        should == [ 9, 3 ]
      end
    end
  end
end
