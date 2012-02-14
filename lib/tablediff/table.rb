module Tablediff
  # Table:
  # | Name | Email | Hat Size |
  # | Dave | a@b.co| 7 3/4    |
  #
  # Raw Table
  # [
  #   [ "Name", "Email", "Hat Size" ]
  #   [ "Dave", "a@b.co", "7 3/4"   ]
  # ]
  #
  # Borrows heavily from https://github.com/jnicklas/turnip
  class Table
    attr_reader :raw

    include Enumerable

    def initialize array_of_arrays
      @raw = array_of_arrays
    end

    def headers
      @headers ||= raw.first
    end

    def rows
      raw.drop 1
    end

    def hashes
      rows.map { |row| Hash[headers.zip(row)] }
    end

  end
end
