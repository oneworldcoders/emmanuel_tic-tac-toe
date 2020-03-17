Gem::Specification.new do |spec|
  spec.name          = "tic_tac_toe"
  spec.version       = "1.0.0"
  spec.authors       = ["Emmanuel Omona"]
  spec.email         = ["emmanuelomona1@gmail.com"]

  spec.summary       = %q{Welcome Tic Tac Toe!}
  spec.description   = %q{A simple game of tic tac toe, connect 3 in a row}

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

end
