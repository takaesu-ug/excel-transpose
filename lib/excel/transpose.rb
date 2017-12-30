require 'rubyXL'

require 'excel/transpose/version'
require 'excel/transpose/reader'
require 'excel/transpose/writer'

module Excel
  module Transpose
    def self.run(input_file:)
      input = Excel::Transpose::Reader.new(input_file)
      Excel::Transpose::Writer.new(input.headers, input.rows).write('output_transpose.xlsx')
    end
  end
end
