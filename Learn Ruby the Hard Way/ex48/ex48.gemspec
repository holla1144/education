# code for this gemspec taken from https://guides.rubygems.org/make-your-own-gem/
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ex48"
  spec.version       = "1.0"
  spec.authors       = ["MH"]
  spec.email         = ["holla1144@gmail.com"]
  spec.summary       = %q{Here's a project arf arf}
  spec.description   = %q{I'm describing my project in greater detail}
  spec.homepage      = "http://something.com"
  spec.license       = "MIT"

  spec.files         = ['lib/ex48.rb']
  # spec.executables   << 'ex48'
  spec.test_files    = ['tests/test_ex48.rb']
  spec.require_paths = ['lib']
end
