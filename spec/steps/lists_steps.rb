steps_for :lists do
  attr_accessor :actual, :expected
  step "the following list:" do |list|
    @expected = list
  end

  step "I compare it to the following list:" do |list|
    @actual = list
  end

  step "the lists are the same" do
    actual.diff(expected).should_not be_different
  end
end
