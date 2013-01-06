# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delegate_attributes/version'

Gem::Specification.new do |gem|
  gem.name          = "delegate_attributes"
  gem.version       = DelegateAttributes::VERSION
  gem.authors       = ["Valery Kvon"]
  gem.email         = ["addagger@gmail.com"]
  gem.homepage      = %q{http://vkvon.ru/projects/delegate_attributes}
  gem.description   = %q{Includes optional reader/writer delegation and unobtrusive errors validation}
  gem.summary       = %q{Almost full attributes delegation from one model instance to another}

  gem.rubyforge_project = "delegate_attributes"
  gem.add_development_dependency "activemodel"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.licenses       = ['MIT']
end
