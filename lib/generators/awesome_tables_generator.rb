class AwesomeTablesGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  
  desc "Creates a base table template at app/views/awesome_tables/_base.html.erb"
  def create_base_tables
    copy_file "_base.html.erb", "app/views/awesome_tables/_base.html.erb"
  end
end