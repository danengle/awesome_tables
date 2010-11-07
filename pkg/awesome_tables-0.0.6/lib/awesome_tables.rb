module AwesomeTables
  
  class Error < StandardError; end

  class NoBlockGiven < Error; end
  
  class UnknownTableType < Error; end 
  
  class NoPartial < Error; end

  class BadData < Error; end
  
  def self.register(table_type, &block)
    AwesomeTables::AwesomeTable::register(table_type, &block)
  end
  
  def self.new(table_type, collection = [], options = {})
    AwesomeTables::AwesomeTable::new(table_type, collection, options)
  end
end

if defined?(::Rails::Railtie)
  require 'awesome_tables/railtie'
end