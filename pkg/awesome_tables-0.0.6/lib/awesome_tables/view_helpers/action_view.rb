module AwesomeTables
  module ViewHelpers
    module ActionView
      # TODO make this only need table_type and infer objects by name
      # TODO add a render method so calling partial is not needed here
      #    e.g. AwesomeTables::AwesomeTable.new(table_type, data).render
      def awesome_table(table_type, collection = nil)
        if collection.nil?
          collection_name = "@#{table_type}"
          collection = instance_variable_get(collection_name)
        end
        raise AwesomeTables::BadData unless collection.is_a? Array
        awesome_table = AwesomeTables.new(table_type, collection)
        render :partial => awesome_table.template, :locals => { :table => awesome_table }
      end

      def table_headers(table)
        content_tag :tr do
          th_tags = []
          table.columns.each do |column|
            th_tags << th_tag(column)
          end
          th_tags.join('')
        end
      end
      
      def th_tag(column)
        content_tag(:th, :class => column[:options][:class]) do
          if column[:options][:header_image]
            image_tag(column[:options][:header_image], :border => 0)
          else
            column[:header]
          end
        end
      end
      
      def table_rows(table)
        rows = []
        table.collection.each do |object|
          rows << table_row(object, table.columns)
        end
        raw(rows.join(''))
      end
      
      def table_row(object, columns)
        content_tag :tr do
          row = []
          columns.each do |column|
            row << td_tag(column, object)
          end
          row.join('')
        end
      end
      
      def td_tag(column, object)
        content_tag(:td) do
          if column[:method].is_a?(Proc)
            column[:method].call(object, self)
          elsif object.respond_to? column[:method]
            object.send(column[:method]).to_s
          else
            render :partial => column[:method], :locals => { :obj => object }
          end
        end
      end
    end
  end
end