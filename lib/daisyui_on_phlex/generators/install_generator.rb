# frozen_string_literal: true

require "rails/generators/base"

module DaisyuiOnPhlex
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install DaisyUI On Phlex"
      source_root File.expand_path("templates", __dir__)

      def copy_daisyui_files
        say "Installing DaisyUI files...", :green
        
        # Download DaisyUI files
        run "curl -sLo app/assets/tailwind/daisyui.js https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.js" rescue nil
        run "curl -sLo app/assets/tailwind/daisyui-theme.js https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.js" rescue nil
      end

      def update_tailwind_config
        tailwind_config_path = "app/assets/tailwind/application.css"
        
        if File.exist?(tailwind_config_path)
          say "Updating Tailwind CSS configuration...", :green
          
          content = File.read(tailwind_config_path)
          
          unless content.include?("@plugin \"./daisyui.js\"")
            # Add DaisyUI plugin line after @import "tailwindcss"
            updated_content = content.gsub(
              /@import "tailwindcss" source\(none\);/,
              "@import \"tailwindcss\" source(none);\n@plugin \"./daisyui.js\";"
            )
            
            File.write(tailwind_config_path, updated_content)
            say "Added DaisyUI plugin to Tailwind CSS configuration", :green
          else
            say "DaisyUI plugin already configured in Tailwind CSS", :yellow
          end
        else
          say "Tailwind CSS configuration not found. Please add @plugin \"./daisyui.js\"; to your Tailwind CSS configuration manually.", :yellow
        end
      end

      def show_readme
        say <<~TEXT, :green

        DaisyUI On Phlex has been installed! 🎉

        You can now use DaisyUI components in your Phlex views:

          # In your Phlex view
          class MyView < Phlex::HTML
            def view_template
              render DaisyuiOnPhlex::Components::Button.new(variant: :primary) do
                "Click me!"
              end
              
              render DaisyuiOnPhlex::Components::Alert.new(variant: :success) do
                "Success message"
              end
            end
          end

        Available components:
        - Button
        - Alert  
        - Card
        - Badge
        - Modal
        - Input
        - And more coming soon...

        For more information, visit: https://github.com/jacob/daisyui-on-phlex

        TEXT
      end
    end
  end
end
