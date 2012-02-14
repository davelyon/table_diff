module Tablediff
  module CompareTables
    extend self

    def compare(actual, expected)
      comparable_actual = ComparableTable.new(actual)
      comparable_expected = ComparableTable.new(expected)
      comparable_actual.diff(comparable_expected)
    end
  end
end
