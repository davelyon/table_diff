require "table_diff/version"

module TableDiff
  # Comparisons
  autoload :CompareTables,       "table_diff/compare_tables"

  autoload :Table,               "table_diff/table"
  autoload :ComparableTable,     "table_diff/comparable_table"

  autoload :Row,                 "table_diff/row"
  autoload :RowWithDifferences,  "table_diff/row_with_differences"

  autoload :OutputFormatter,     "table_diff/output_formatter"

  # Error classes
  autoload :DifferentTables,     "table_diff/different_tables"
  autoload :DifferentHeaders,    "table_diff/different_headers"

  # Strategies
  autoload :Diff,                "table_diff/diff"
  module Strategies
    autoload :Differentiator,    "table_diff/strategies/differentiator"
  end

  # Framework integrations
  autoload :Turnip,              "table_diff/turnip"

  class MissingRows < StandardError; end
end
