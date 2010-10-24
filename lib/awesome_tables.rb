module AwesomeTables
  
  class NoBlockGivenException < Exception
  end
  
  class UnknownTableTypeException < Exception 
  end 
  
  class NoPartialException < Exception
  end
end

if defined?(::Rails::Railtie)
  require 'awesome_tables/railtie'
end