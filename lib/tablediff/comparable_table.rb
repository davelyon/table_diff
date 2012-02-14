module Tablediff
  class ComparableTable
    attr_reader :table

    def initialize table
      @table = table
    end

    def rows
      @rows ||= table.hashes.map { |hash| Row.new(hash) }
    end

    def headers_row
      Row.new Hash[table.headers.zip table.headers]
    end

    def diff(expected)
      fail MissingRows unless expected.rows.count == rows.count
      Differentiator.new(self, expected).diff
    end

    def different?
      false
    end
  end

  class Differentiator
    attr_reader :actual, :expected
    def initialize(actual, expected)
      @actual, @expected = actual, expected
    end

    def rows
      actual.rows.each.zip expected.rows.each
    end

    def diff
      if diff_rows.any? &:different?
        raise DifferentTables.new(actual, expected, diff_rows)
      else
        actual
      end
    end

    def diff_rows
      @diffs = rows.map do |pair|
        pair.first.diff pair.last
      end
    end
  end
end
