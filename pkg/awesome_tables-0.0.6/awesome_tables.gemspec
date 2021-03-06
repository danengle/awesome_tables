# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{awesome_tables}
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Engle"]
  s.cert_chain = ["/Users/danengle/.ssh/gem-public_cert.pem"]
  s.date = %q{2010-11-07}
  s.description = %q{A gem for creating awesome, consistently styled tables}
  s.email = %q{engle.68 @nospam@ gmail.com}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc", "lib/awesome_tables.rb", "lib/awesome_tables/awesome_table.rb", "lib/awesome_tables/formatters.rb", "lib/awesome_tables/formatters/html.rb", "lib/awesome_tables/railtie.rb", "lib/awesome_tables/scrap.rb", "lib/awesome_tables/view_helpers/action_view.rb", "lib/generators/awesome_tables_generator.rb", "lib/generators/templates/_base.html.erb"]
  s.files = ["CHANGELOG.rdoc", "MIT-LICENSE", "Manifest", "README.rdoc", "Rakefile", "awesome_tables.gemspec", "lib/awesome_tables.rb", "lib/awesome_tables/awesome_table.rb", "lib/awesome_tables/formatters.rb", "lib/awesome_tables/formatters/html.rb", "lib/awesome_tables/railtie.rb", "lib/awesome_tables/scrap.rb", "lib/awesome_tables/view_helpers/action_view.rb", "lib/generators/awesome_tables_generator.rb", "lib/generators/templates/_base.html.erb", "test/awesome_tables_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/danengle/awesome_tables}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Awesome_tables", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{awesome_tables}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/Users/danengle/.ssh/gem-private_key.pem}
  s.summary = %q{A gem for creating awesome, consistently styled tables}
  s.test_files = ["test/awesome_tables_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
