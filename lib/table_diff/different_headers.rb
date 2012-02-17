module TableDiff
  class DifferentHeaders < Exception

    def initialize actual, expected
      diff = RowWithDifferences.new(actual, expected)
      super OutputFormatter.new([diff])
    end

  end
end
