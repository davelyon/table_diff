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
      row_diffs = []
      tables_different = false
      rows.each_with_index do |actual_row, index|
        diff = actual_row.diff expected.rows[index]
        tables_different = diff.different?
        row_diffs << diff
      end
      if tables_different
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
