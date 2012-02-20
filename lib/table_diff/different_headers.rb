module TableDiff
  class DifferentHeaders < StandardError

    def initialize actual, expected
      diff = RowWithDifferences.new(actual, expected)
      super OutputFormatter.new([diff])
    end

  end
end
