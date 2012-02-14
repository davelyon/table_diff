require 'spec_helper'

describe Tablediff::DifferentTables do
  subject { described_class.new nil, nil, nil }

  describe "#different?" do
    it { should be_different }
  end
end
