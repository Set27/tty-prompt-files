# frozen_string_literal: true

require_relative "lib/tty/files/version"

Gem::Specification.new do |spec|
  spec.name = "tty-prompt-files"
  spec.version = TTY::Files::VERSION
  spec.authors = ["Set27"]
  spec.email = ["matvei.traz@gmail.com"]

  spec.summary = "Extension for tty-prompt that allow interactive CLI file system element selection"
  spec.homepage = "https://github.com/Set27/tty-prompt-files"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Set27/tty-prompt-files"
  spec.metadata["changelog_uri"] = "https://github.com/Set27/tty-prompt-files"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-prompt", "~> 0.23.1"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.14.1"
end
