module TableDiff
  module Strategies
    class List
      attr_reader :actual, :expected
      def initialize(actual, expected)
        @actual, @expected = actual, expected
      end

      def diff
       if  actual.to_list == expected.to_list
         actual
       end
      end
    end
  end
end
