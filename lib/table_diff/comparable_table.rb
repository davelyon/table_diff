module TableDiff
  class ComparableTable
    attr_reader :table

    def initialize table
      @table = table
    end

    def headers
      @table.headers
    end

    def rows
      @rows ||= table.hashes.map { |hash| Row.new(hash) }
    end

    def headers_row
      Row.new Hash[table.headers.zip table.headers]
    end

    def diff(expected)
      fail MissingRows unless expected.rows.count == rows.count
      Strategies::Differentiator.new(self, expected).diff
    end

    def different?
      false
    end
  end
end
