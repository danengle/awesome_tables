module AwesomeTables
  class AwesomeTable
    @@tables = {}
    
    attr_accessor :data, :columns, :partial, :caption

    def self.register(table_type, &block)
      raise AwesomeTables::NoBlockGivenException unless block_given?
      @@tables[table_type] = block
    end
    
    def initialize(table_type, data = [], options = {})
      @data = data
      @paginate = true if @data.is_a? WillPaginate::Collection
      @columns = []
      @template = options[:template] ||= 'awesome_tables/base'
      # is this the best way to do this?
      raise AwesomeTables::UnknownTableTypeException if @@tables[table_type].blank?
      @@tables[table_type].call(self)
    end
    
    def caption?
      !@caption.blank?
    end
    
    def paginate?
      @paginate
    end
    
    def set_caption(caption)
      @caption = caption
    end
    # example column colls
    # t.column :created_at, :display_created_at
    # t.column :body, :partial => 'awesome_tables/posts/body'
    # t.column :comments, :comment_count, :with_image => 'comments.png'
    # t.column :full_name
    def column(*args)
      name = args[0].to_s.titleize
      if args[1].nil?
        method = args[0]
      elsif args[1].is_a? Symbol
        method = args[1]
        options = args[2]
      else
        raise AwesomeTables::NoPartialProvidedException unless args[1].keys.include?(:partial)
        method = args[1].delete(:partial)
        options = args[1]
      end
      @columns << { :header => name, :method => method, :options => options ||= {} }
    end
  end
end