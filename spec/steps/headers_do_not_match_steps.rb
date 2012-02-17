steps_for :headers_do_not_match do
  step "a different headers error is raised" do
    expect do
      other_table.diff(table)
    end.to raise_error TableDiff::DifferentHeaders
  end
end
