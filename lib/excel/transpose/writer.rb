module Excel
  module Transpose
    class Writer
      def initialize(headers, rows)
        @headers = headers
        @rows = rows
        @workbook = RubyXL::Workbook.new
      end

      def write(output)
        @rows.map do |row|
          sheet_name = row.first # 1つ目のデータをシート名にする
          sheet_data = [@headers, row].transpose

          worksheet = @workbook.add_worksheet(sheet_name)
          worksheet.change_column_width(0, 15)
          worksheet.change_column_width(1, 100)



          sheet_data.each_with_index do |(label, value), index|
            worksheet.change_column_vertical_alignment(index, 'top')

            label_cell = worksheet.add_cell(index, 0, label)
            value_cell = worksheet.add_cell(index, 1, value)

            label_cell.change_text_wrap(true)
            set_border(label_cell)

            value_cell.change_text_wrap(true)
            set_border(value_cell)
          end
        end

        @workbook.worksheets.delete_at(0) # 初期シート削除
        @workbook.write(output)
      end

      private

      def set_border(cell)
        %i(left top right bottom).each do |pos|
          cell.change_border(pos, 'thin')
        end
      end
    end
  end
end
