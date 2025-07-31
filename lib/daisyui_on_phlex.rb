# frozen_string_literal: true

require_relative "daisyui_on_phlex/version"
require_relative "daisyui_on_phlex/base"
require_relative "daisyui_on_phlex/railtie" if defined?(Rails)

# Load all component files
Dir[File.join(__dir__, "daisyui_on_phlex", "components", "*.rb")].each { |file| require file }

module DaisyuiOnPhlex
  class Error < StandardError; end
end
