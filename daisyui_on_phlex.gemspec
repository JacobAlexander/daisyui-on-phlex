# frozen_string_literal: true

require_relative "lib/daisyui_on_phlex/version"

Gem::Specification.new do |spec|
  spec.name = "daisyui_on_phlex"
  spec.version = DaisyuiOnPhlex::VERSION
  spec.authors = ["JacobAlexander"]
  spec.email = ["github@im.jacobalexander.pl"]

  spec.summary = "DaisyUI components for Phlex - A Ruby gem integrating DaisyUI with Phlex components"
  spec.description = "A Ruby gem that provides DaisyUI components as Phlex components for Rails applications, making it easy to use DaisyUI's beautiful components in your Ruby on Rails projects."
  spec.homepage = "https://github.com/jacob/daisyui-on-phlex"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jacob/daisyui-on-phlex"
  spec.metadata["changelog_uri"] = "https://github.com/jacob/daisyui-on-phlex/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://github.com/jacob/daisyui-on-phlex/blob/main/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_dependency "phlex", "~> 1.0"
  spec.add_dependency "phlex-rails", "~> 1.0"
  spec.add_dependency "railties", "~> 6.0", ">= 6.0"
  spec.add_dependency "tailwind_merge", "~> 0.12"

  spec.add_development_dependency "rails", "~> 8.0", ">= 8.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
