require 'awesome_tables'

module AwesomTables
  class Railtie < Rails::Railtie
    initializer < "awesome_tables.action_view" do |app|
      require 'awesome_tables/view_helpers/action_view'
      ActionView::Base.send(:include, AwesomeTables::ViewHelpers::ActionView)
    end
  end
end