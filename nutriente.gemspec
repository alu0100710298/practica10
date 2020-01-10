lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nutriente/version"

Gem::Specification.new do |spec|
  spec.name          = "nutriente"
  spec.version       = Nutriente::VERSION
  spec.authors       = ["Sergio Moreno Martin"]
  spec.email         = ["alu0100710298@ull.edu.es"]

  spec.summary       = %q{Nutrientes de alimentos}
  spec.description   = %q{Gema nutriente}
  spec.homepage      = "https://github.com/alu0100710298/practica10.git"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/alu0100710298/practica10.git"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/alu0100710298/practica10.git"

  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "coveralls"

  
end
