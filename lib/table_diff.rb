require "table_diff/version"

module TableDiff
  autoload :Table,               "table_diff/table"
  autoload :ComparableTable,     "table_diff/comparable_table"
  autoload :DifferentTables,     "table_diff/different_tables"

  autoload :DifferentHeaders,    "table_diff/different_headers"

  autoload :Row,                 "table_diff/row"
  autoload :RowWithDifferences,  "table_diff/row_with_differences"

  autoload :CompareTables,       "table_diff/compare_tables"
  autoload :OutputFormatter,     "table_diff/output_formatter"

  autoload :Turnip,              "table_diff/turnip"

  class MissingRows < Exception; end
end
