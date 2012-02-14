module Tablediff
  class DifferentTables < Exception
    def initialize actual, expected, row_diffs
      row_diffs.unshift actual.headers_row
      super OutputFormatter.new(row_diffs)
    end
  end
end
