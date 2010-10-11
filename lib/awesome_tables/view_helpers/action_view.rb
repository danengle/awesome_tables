module AwesomeTables
  module ViewHelpers
    module ActionView
      def awesome_table(table_type, data = [])
        "awesome_table: #{table_type}, #{data.size}"
      end
    end
  end
end