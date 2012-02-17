steps_for :same_tables do
  attr_reader :other_table
  step "the tables are the same" do
    other_table.diff(table).should_not be_different
  end
end

