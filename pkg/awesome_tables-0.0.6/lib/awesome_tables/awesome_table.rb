module AwesomeTables
  class AwesomeTable
    @@tables = {}
    
    attr_accessor :collection, :columns, :partial, :caption, :template

    def self.register(table_type, &block)
      raise AwesomeTables::NoBlockGiven unless block_given?
      @@tables[table_type] = block
    end
    
    def initialize(table_type, collection = [], options = {})
      @collection = collection
      @paginate = true if @collection.is_a? WillPaginate::Collection
      @columns = []
      @template = options[:template] ||= 'awesome_tables/base'
      # is this the best way to do this?
      raise AwesomeTables::UnknownTableType if @@tables[table_type].blank?
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
    # t.column :comments, :comment_count, :with_header => 'comments.png'
    # t.column :full_name
    # I can't figure out how to get content_tag and other helper methods to
    # get used correctly when used inside blocks. For now, passing in reference
    # to self that has those methods defined.
    # t.column :full_name do |obj, c|
    #   obj.full_name +
    #   c.content_tag(:div, :class => 'actions') do
    #   c.link_to("Edit", c.edit_admin_user_path(obj))
    #   end
    # end
    def column(*args, &block)
      name = args[0].to_s.titleize
      if block_given?
        method = block
        options = args[1]
      # t.column :full_name
      elsif args[1].nil?
        method = args[0]
      # t.column :created_at, :display_created_at
      elsif args[1].is_a? Symbol
        method = args[1]
        options = args[2]
      # t.column :body, :partial => 'awesome_tables/posts/body'
      # t.column :comments, :with_header => 'comments.png'
      else
        method = if args[1].keys.include?(:partial)
          args[1].delete(:partial)
        else
          args[0]
        end  
        options = args[1]
      end
      @columns << { :header => name, :method => method, :options => options ||= {} }
    end
  end
end