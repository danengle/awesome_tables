module AwesomeTables
  module ViewHelpers
    module ActionView
      # TODO make this only need table_type and infer objects by name
      # TODO add a render method so calling partial is not needed here
      #    e.g. AwesomeTables::AwesomeTable.new(table_type, data).render
      def awesome_table(table_type, data)
        raise "awesome_table data is not an Array" unless data.is_a? Array
        awesome_table = AwesomeTables::AwesomeTable.new(table_type, data)
        render :partial => awesome_table.template, :locals => { :table => awesome_table }
      end
    end
  end
end