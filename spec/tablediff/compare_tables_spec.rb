require 'spec_helper'

describe Tablediff::CompareTables do
  let(:diff) { Tablediff::CompareTables.compare actual, expected }

  subject { diff }
  context "when tables are the same" do
    let(:actual) do
      Tablediff::Table.new [ [ "Name", "Email", "Hat Size" ], [ "Dave", "a@b.co", "7 3/4"   ] ]
    end

    let(:expected) do
      actual
    end
    it { should_not be_different }
  end

  context "when tables are not the same" do
    let(:actual) do
      Tablediff::Table.new [ [ "Name", "Email", "Hat Size" ], [ "Dave", "a@b.co", "7"   ] ]
    end

    let(:expected) do
      Tablediff::Table.new [ [ "Name", "Email", "Hat Size" ], [ "Dave", "a@b.co", 7 ] ]
    end
    it { expect {subject}.to raise_error Tablediff::DifferentTables }
  end
end
