steps_for :table do
  attr_reader :table, :other_table

  step "the following table:" do |table|
    @table = table
  end

  step "I compare it with the following table:" do |table|
    @other_table = table
  end
end
