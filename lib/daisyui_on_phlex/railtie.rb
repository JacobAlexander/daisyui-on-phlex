# frozen_string_literal: true

require "rails/railtie"

module DaisyuiOnPhlex
  class Railtie < Rails::Railtie
    initializer "daisyui_on_phlex.setup" do |app|
      # Add any Rails-specific setup here
      if defined?(Phlex::Rails)
        # Ensure Phlex can find our components
        app.config.autoload_paths += %W[
          #{File.join(__dir__, "components")}
        ]
      end
    end

    generators do
      require_relative "generators/install_generator"
    end
  end
end
