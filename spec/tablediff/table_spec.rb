require 'spec_helper'

describe Tablediff::Table do
  let(:raw_table) do
    [
      [ "Name", "Email", "Hat Size"],
      [ "Dave", "a@b.co", "7 3/4"  ]
    ]
  end

  let(:table) { described_class.new(raw_table) }

  it "keeps the raw state" do
    table.raw.should == raw_table
  end

  describe "#headers" do
    subject { table.headers }
    it "is the first row of the table" do
      should == raw_table[0]
    end
  end

  describe "#rows" do
    subject { table.rows }
    it "is all but the first row" do
      should == [raw_table[1]]
    end
  end

  describe "#hashes" do
    subject { table.hashes }

    let(:hashes) do
      [{ "Name"     => "Dave",
        "Email"    => "a@b.co",
        "Hat Size" => "7 3/4" }]
    end

    it "hashes the header => column" do
      should == hashes
    end
  end
end
