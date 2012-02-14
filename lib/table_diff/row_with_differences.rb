module TableDiff
  class RowWithDifferences
    attr_reader :actual, :expected
    def initialize actual, expected
      @actual, @expected = actual, expected
    end

    def strings
      pairs = actual.raw.values.zip expected.raw.values
      pairs.map do |pair|
        if pair.inject(&:==)
          "#{pair.first}"
        else
          "#{pair.first} (#{pair.last})"
        end
      end
    end

    def widths
      strings.map(&:size)
    end

    def different?
      true
    end
  end
end
