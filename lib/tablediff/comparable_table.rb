module Tablediff
  class ComparableTable
    attr_reader :table

    def initialize table
      @table = table
    end

    def rows
      @rows = table.hashes.map { |hash| Row.new(hash) }
    end

    def diff(expected)
      fail MissingRows unless expected.rows.count == rows.count
      expected_row = expected.rows.each
      row_diffs = rows.each_with_object([]) do |actual_row, diff_rows|
        diff_rows << actual_row.diff(expected_row.next)
      end
      if row_diffs.any? &:different?
        DifferentTables.new(self, expected, row_diffs)
      else
        self
      end
    end

    def different?
      false
    end
  end
end
