module Excel
  module Transpose
    class Reader
      attr_reader :headers, :rows

      def initialize(input)
        @sheet = RubyXL::Parser.parse(input)[0]
        @headers = @sheet.first.cells.map(&:value)
        @rows = @sheet[1..-1].map { |a| a.cells.map(&:value) }
      end
    end
  end
end
