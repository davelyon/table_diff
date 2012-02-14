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

    def strings
      @strings ||= raw.values.map(&:to_s)
    end

    def widths
      strings.map(&:size)
    end

    def ==(row)
      row.raw == raw
    end

    def different?
      false
    end

  end

end
