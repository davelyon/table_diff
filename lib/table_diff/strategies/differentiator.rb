module TableDiff
  module Strategies
    class Differentiator
      attr_reader :actual, :expected
      def initialize(actual, expected)
        @actual, @expected = actual, expected
      end

      def rows
        actual.rows.each.zip expected.rows.each
      end

      def same_headers?
        actual.headers == expected.headers
      end

      def diff
        raise DifferentHeaders.new(actual.headers_row, expected.headers_row) unless same_headers?
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
end
