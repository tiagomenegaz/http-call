Gem::Specification.new do |s|
  s.name        = 'http_call'
  s.version     = '0.0.1'
  s.date        = '2019-02-27'
  s.summary     = "Ruby Gem to make HTTP requests"
  s.description = "This Gem is an abstraction of the basic ruby HTTP request classes with retry functionality"
  s.authors     = ["Tiago Menegaz"]
  s.email       = 'tmmgarcia7@gmail.com'
  s.files       = `git ls-files`.split($/).select { |file_name| file_name.include?('.rb') }
  s.homepage    = 'http://rubygems.org/gems/hola'
  s.license     = 'MIT'
end