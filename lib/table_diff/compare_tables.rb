module TableDiff
  module CompareTables
    extend self

    def compare(actual, expected)
      comparable_actual = ComparableTable.new(actual)
      comparable_expected = ComparableTable.new(expected)
      comparable_actual.diff(comparable_expected)
    end

    def compare_with_surplus_columns(actual, expected)
      fail
    end

    def compare_with_surplus_rows(actual, expected)
      fail
    end

    def comparw_with_surplus_rows_and_columns(actual, expected)
      fail
    end
  end
end
