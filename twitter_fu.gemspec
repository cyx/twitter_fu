# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twitter_fu}
  s.description = %q{quick and short lib for consuming rss of a twitter user}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cyril David"]
  s.date = %q{2009-06-03}
  s.email = %q{cyx.ucron@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/twitter_fu.rb",
     "lib/twitter_fu/client.rb",
     "test/client_test.rb",
     "test/fixtures/cyx.rss",
     "test/test_helper.rb",
     "test/twitter_fu_test.rb"
  ]
  s.homepage = %q{http://github.com/cyx/twitter_fu}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Library for accessing feeds given a username (readonly)}
  s.test_files = [
    "test/client_test.rb",
     "test/test_helper.rb",
     "test/twitter_fu_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end