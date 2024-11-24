require_relative "lib/fink/version"

Gem::Specification.new do |spec|
  spec.name = "fink"
  spec.version = Fink::VERSION
  spec.authors = ["Sebastian Rollen"]
  spec.email = ["seb@rollen.io"]
  spec.homepage = "https://github.com/SebRollen/fink"
  spec.summary = "Rails engine that logs all outgoing HTTP requests"
  spec.description = "Rails engine that logs all outgoing HTTP requests"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3.2"
end
