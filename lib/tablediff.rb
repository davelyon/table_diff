require "tablediff/version"

module Tablediff
  autoload :Table,               "tablediff/table"
  autoload :ComparableTable,     "tablediff/comparable_table"
  autoload :DifferentTables,     "tablediff/different_tables"

  autoload :Row,                 "tablediff/row"
  autoload :RowWithDifferences,  "tablediff/row_with_differences"

  autoload :CompareTables,       "tablediff/compare_tables"
  autoload :OutputFormatter,     "tablediff/output_formatter"

  class MissingRows < Exception; end
end
