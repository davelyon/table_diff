steps_for :headers_do_not_match do
  step "a different headers error is raised" do
    expect do
      other_table.diff(table).should_not be_different
    end.to raise_error TableDiff::DifferentHeaders
  end
end
