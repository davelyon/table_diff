module TableDiff
  class OutputFormatter
    attr_reader :rows
    def initialize(rows)
      @rows = rows
    end

    def row_widths
      rows.map(&:widths).transpose.map(&:max)
    end

    def row_strings
      rows.map(&:strings)
    end

    def adjusted_columns
      row_strings.each_with_object([[], row_widths]) do |strings, (rows, widths)|
        rows << strings.map.with_index do |string, index|
          string.rjust(widths[index])
        end
      end.first
    end

    def to_s
      adjusted_columns.map do |row|
        "| " + row.join(" | ") + " |"
      end.join("\n")
    end
  end
end
