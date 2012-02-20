module TableDiff
  class Diff
    attr_reader :actual, :expected
    def initialize(actual, expected)
      @actual, @expected = actual, expected
    end

    def different?
      fail MissingRows unless expected.rows.count == actual.rows.count
      Strategies::Differentiator.new(actual, expected).diff.different?
    end
  end
end
