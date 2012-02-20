require 'spec_helper'

describe TableDiff::CompareTables do
  let(:diff) { TableDiff::CompareTables.compare actual, expected }

  subject { diff }
  context "when tables are the same" do
    let(:actual) do
      TableDiff::Table.new [ [ "Name", "Email", "Hat Size" ], [ "Dave", "a@b.co", "7 3/4"   ] ]
    end

    let(:expected) do
      actual
    end
    it { should_not be_different }
  end

  context "when tables are not the same" do
    let(:actual) do
      TableDiff::Table.new [ [ "Name", "Email", "Hat Size" ], [ "Dave", "a@b.co", "7"   ] ]
    end

    let(:expected) do
      TableDiff::Table.new [ [ "Name", "Email", "Hat Size" ], [ "Dave", "a@b.co", 7 ] ]
    end
    it { expect {subject.different?}.to raise_error TableDiff::DifferentTables }
  end
end
