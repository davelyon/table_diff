steps_for :extra_rows do
  def diff
other_table.diff(table)
  end
  step "the tables are the same" do
    diff.should_not be_different
  end

  step "the actual table should have the extra rows" do |rows|
    diff.extra_rows.should == rows.raw
  end

  step "the actual table should be missing the rows" do |rows|
    diff.missing_rows.should == rows.raw
  end
end
