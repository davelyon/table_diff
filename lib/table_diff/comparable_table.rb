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

    def with_selected_columns(*cols)
      cols.map! do |col|
        headers.index col
      end
      self.class.new table_for_column_ids(cols)
    end

    def diff(expected)
      fail MissingRows unless expected.rows.count == rows.count
      Strategies::Differentiator.new(self, expected).diff
    end

    def different?
      false
    end

    private

    def table_for_column_ids(ids)
      Table.new(table.raw.each_with_object([]) do |row, ary|
        ary << row.values_at(*ids)
      end)
    end
  end
end
