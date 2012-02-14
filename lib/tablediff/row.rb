module Tablediff
  class Row
    attr_reader :raw

    def initialize hash
      @raw = hash
    end

    def diff(row)
      return self if row == self
      RowWithDifferences.new(self, row)
    end

    def ==(row)
      row.raw == raw
    end

    def different?
      false
    end

  end

end
