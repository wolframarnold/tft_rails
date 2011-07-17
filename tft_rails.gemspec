# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "tft_rails"
  s.summary = "TFT Rails provides Test-First Teaching exercises for learning Rails adapted from RailsTutorial by Michael Hartl and sponsored by Marakana"
  s.description = "TFT Rails is a framework for learning Rails, providing incremental sets of specs and solutions, building up a microblogging application based on RailsTutorial by Michael Hartl. See README for installation & use."
  s.author = "Wolfram Arnold"
  s.email = "wolfram@rubyfocus.biz"
  s.homepage = "https://github.com/wolframarnold/tft_rails"
  s.license = "MIT"
  s.files = Dir["{app,lib,config}/**/*"] + %w(LICENSE Rakefile Gemfile README.md .rvmrc .gitignore)
  s.version = "0.0.1"
  s.add_dependency('rdiscount', '~> 1.6.8')
end
