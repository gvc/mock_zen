require 'rubygems'
require 'rake'

Gem::Specification.new do |spec|
  spec.name = 'mock_zen'
  spec.version = File.read('VERSION').strip
  spec.summary = 'A radically simple mocking library'
  
  spec.files = FileList['lib/*', 'lib/**/*', 'Rakefile', 'test/*', 'README'].to_a
  
  spec.author = 'Guilherme Carvalho'
  spec.email = 'guilherme@guava.com.br'
  spec.homepage = 'http://zen.guilhermecarvalho.com.br'
  
  spec.has_rdoc = true
  spec.description = <<-END
    Mock zen is an extremely simple mocking library.
    Makes TATFT an easy and sane thing to do. 
  END
end