# frozen_string_literal: true

require "rails/generators/base"

module DaisyuiOnPhlex
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install DaisyUI On Phlex"
      source_root File.expand_path("../../daisyui_on_phlex", __dir__)
      class_option :force, type: :boolean, default: false

      def install_phlex_rails
        if gem_installed?("phlex-rails")
          say "phlex-rails is already installed", :green
        else
          say "Adding phlex-rails to Gemfile", :green
          run %(bundle add phlex-rails)

          say "Generating phlex-rails structure", :green
          run "bin/rails generate phlex:install"
        end
      end

      def install_daisyui_npm
        if File.exist?("package.json")
          say "Installing DaisyUI via NPM...", :green
          
          # Check if daisyui is already installed
          package_json = File.read("package.json")
          unless package_json.include?('"daisyui"')
            if system("which npm > /dev/null")
              run "npm install daisyui"
              say "DaisyUI installed via NPM", :green
            elsif system("which yarn > /dev/null")
              run "yarn add daisyui"
              say "DaisyUI installed via Yarn", :green
            else
              say "Neither NPM nor Yarn found. Please install DaisyUI manually: npm install daisyui", :yellow
            end
          else
            say "DaisyUI already installed in package.json", :yellow
          end
        else
          say "No package.json found. Skipping NPM installation.", :yellow
          say "Please install DaisyUI manually: npm install daisyui", :yellow
        end
      end

      def copy_daisyui_files
        say "DaisyUI assets are now provided automatically via Rails Engine! 🎉", :green
        say "CSS and JS files are included automatically in your application.", :blue
      end

      def copy_components_to_vendor
        say "Copying all DaisyUI components to vendor directory...", :green
        
        components_source_path = File.join(self.class.source_root, "components")
        component_files = Dir.glob(File.join(components_source_path, "*.rb"))
        say "Found #{component_files.count} component files", :blue
        
        component_files.each do |component_path|
          component_file_name = File.basename(component_path)
          # We are using relative path from source_root
          relative_path = File.join("components", component_file_name)
          destination_path = Rails.root.join("vendor/daisyui_on_phlex/components", component_file_name)
          
          copy_file relative_path, destination_path, force: options["force"]
        end
      end

      def copy_base_class
        say "Copying base class...", :green
        # We are using relative path from source_root
        copy_file "base.rb", Rails.root.join("vendor/daisyui_on_phlex/base.rb"), force: options["force"]
      end

      def create_vendor_initializer
        vendor_initializer_path = Rails.root.join("config/initializers/daisyui_on_phlex.rb")
        
        create_file vendor_initializer_path, <<~RUBY, force: options["force"]
          # frozen_string_literal: true

          module DaisyuiOnPhlex
            extend Phlex::Kit
          end

          # Require base.rb first
          require Rails.root.join("vendor/daisyui_on_phlex/base.rb")

          # Load all DaisyUI components from vendor directory
          Dir[Rails.root.join("vendor/daisyui_on_phlex/components/*.rb")].each do |file|
            require file
          end

          # Configure TailwindMerge for CSS class merging
          if defined?(TailwindMerge) && defined?(ClassVariants)
            ClassVariants.configure do |config|
              merger = TailwindMerge::Merger.new
              config.process_classes_with do |classes|
                merger.merge(classes)
              end
            end
          end
        RUBY
        
        say "Created vendor initializer: config/initializers/daisyui_on_phlex.rb", :green
      end

      def update_tailwind_config
        say "📝 To include DaisyUI styles in your application:", :green
        say ""
        say "1. Add to your main CSS file (application.css or application.tailwind.css):", :yellow
        say "   //= require daisyui_on_phlex", :cyan
        say ""
        say "2. Or in your JavaScript file (application.js):", :yellow
        say "   //= require daisyui_on_phlex", :cyan
        say ""
        say "3. For Tailwind CSS, ensure your tailwind.config.js includes:", :yellow
        say '   content: ["./vendor/daisyui_on_phlex/**/*.rb"]', :cyan
        say ""
      end

      def show_readme
        components_source_path = File.join(self.class.source_root, "components")
        component_count = Dir.glob(File.join(components_source_path, "*.rb")).count
        
        say <<~TEXT, :green

        DaisyUI On Phlex has been installed! 🎉

        ✅ All #{component_count} components have been copied to vendor/daisyui_on_phlex/
        ✅ DaisyUI CSS & JS automatically provided via Rails Engine
        ✅ Vendor initializer created (config/initializers/daisyui_on_phlex.rb)
        ✅ Ready to use in your Phlex views

        📦 Optional: Install DaisyUI via NPM for latest features:
          npm install daisyui
          # or
          yarn add daisyui

        🎨 Recommended gems for better CSS handling:
          gem 'tailwind_merge'
          gem 'class_variants'

        🚀 You can now use DaisyUI components in your Phlex views:

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

        🎯 All 61+ components are now available:
        - Button, Alert, Card, Badge, Modal, Input
        - Navigation: Navbar, Menu, Breadcrumbs, Tabs
        - Data Display: Table, Stat, Timeline, Avatar
        - Forms: Checkbox, Radio, Select, Toggle
        - And many more...

        📁 Components are in vendor/daisyui_on_phlex/components/ and can be customized.
        📚 For documentation: https://github.com/jacob/daisyui-on-phlex

        TEXT
      end

      private

      def gem_installed?(name)
        Gem::Specification.find_all_by_name(name).any?
      end
    end
  end
end
