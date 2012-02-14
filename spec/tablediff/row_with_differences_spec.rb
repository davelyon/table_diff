require 'spec_helper'

describe Tablediff::RowWithDifferences do
  subject { described_class.new nil, nil }
  it { should be_different }
end
