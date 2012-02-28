require 'diff-lcs'

module TableDiff
  class Diff
    attr_reader :actual, :expected
    def initialize(actual, expected)
      @actual, @expected = actual, expected
    end

    def extra_rows
      actual.raw_table - diff
    end

    def missing_rows
      expected.raw_table - diff
    end

    def different?
      fail MissingRows unless expected.rows.count == actual.rows.count
      Strategies::Differentiator.new(actual, expected).diff.different?
    end

    def diff
      @diff ||= ::Diff::LCS.LCS(actual.raw_table, expected.raw_table)
    end
  end
end
