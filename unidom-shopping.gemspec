$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/shopping/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-shopping'
  spec.version     = Unidom::Shopping::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-shopping'
  spec.summary     = 'Unidom Shopping Domain Model Engine 购物领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Shopping domain model engine includes Shopping Cart and Shopping Item models. Unidom (统一领域对象模型)是一系列的领域模型引擎。购物领域模型引擎包括购物车和购物项的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '~> 0.8'

end
