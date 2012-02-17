require 'turnip/table'
module TableDiff::Turnip
  class Turnip::Table
    def diff(other)
      TableDiff::CompareTables.compare(self, other)
    end
  end
end
