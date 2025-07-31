# frozen_string_literal: true

# Example usage of DaisyUI On Phlex components
# This file demonstrates how to use the various components

require_relative "lib/daisyui_on_phlex"

class ExampleView < Phlex::HTML
  def view_template
    html do
      head do
        title { "DaisyUI On Phlex Example" }
        # In a real Rails app, you would have Tailwind CSS and DaisyUI configured
        link rel: "stylesheet", href: "https://cdn.tailwindcss.com"
        script src: "https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css"
      end

      body(class: "p-8 space-y-8") do
        h1(class: "text-3xl font-bold mb-8") { "DaisyUI On Phlex Components Demo" }

        # Button examples
        section(class: "space-y-4") do
          h2(class: "text-2xl font-semibold") { "Buttons" }
          div(class: "space-x-4") do
            render DaisyuiOnPhlex::Components::Button.new(variant: :primary) { "Primary" }
            render DaisyuiOnPhlex::Components::Button.new(variant: :secondary) { "Secondary" }
            render DaisyuiOnPhlex::Components::Button.new(variant: :accent, outline: true) { "Accent Outline" }
            render DaisyuiOnPhlex::Components::Button.new(variant: :success, size: :lg) { "Large Success" }
          end
        end

        # Alert examples
        section(class: "space-y-4") do
          h2(class: "text-2xl font-semibold") { "Alerts" }
          render DaisyuiOnPhlex::Components::Alert.new(variant: :info) do
            "This is an info alert with an icon!"
          end
          render DaisyuiOnPhlex::Components::Alert.new(variant: :success) do
            "Success! Your operation completed successfully."
          end
          render DaisyuiOnPhlex::Components::Alert.new(variant: :warning) do
            "Warning! Please check your input."
          end
          render DaisyuiOnPhlex::Components::Alert.new(variant: :error) do
            "Error! Something went wrong."
          end
        end

        # Card example
        section(class: "space-y-4") do
          h2(class: "text-2xl font-semibold") { "Card" }
          render DaisyuiOnPhlex::Components::Card.new(bordered: true, class: "w-96") do |card|
            card.body do
              card.title { "Card Title" }
              p { "This is a beautiful card component with DaisyUI styling." }
              card.actions do
                render DaisyuiOnPhlex::Components::Button.new(variant: :primary) { "Action" }
                render DaisyuiOnPhlex::Components::Button.new(variant: :ghost) { "Cancel" }
              end
            end
          end
        end

        # Badge examples
        section(class: "space-y-4") do
          h2(class: "text-2xl font-semibold") { "Badges" }
          div(class: "space-x-2") do
            render DaisyuiOnPhlex::Components::Badge.new(variant: :primary) { "Primary" }
            render DaisyuiOnPhlex::Components::Badge.new(variant: :secondary, outline: true) { "Secondary" }
            render DaisyuiOnPhlex::Components::Badge.new(variant: :success, size: :lg) { "Success" }
            render DaisyuiOnPhlex::Components::Badge.new(variant: :error, size: :sm) { "Error" }
          end
        end

        # Input examples
        section(class: "space-y-4") do
          h2(class: "text-2xl font-semibold") { "Inputs" }
          div(class: "space-y-2 max-w-md") do
            render DaisyuiOnPhlex::Components::Input.new(
              placeholder: "Enter your name",
              variant: :primary
            )
            render DaisyuiOnPhlex::Components::Input.new(
              type: :email,
              placeholder: "Enter your email",
              variant: :secondary,
              size: :lg
            )
          end
        end

        # Modal example
        section(class: "space-y-4") do
          h2(class: "text-2xl font-semibold") { "Modal" }
          
          # Button to open modal
          label(for: "demo-modal", class: "btn btn-primary") { "Open Modal" }
          
          # Modal component
          render DaisyuiOnPhlex::Components::Modal.new(id: "demo-modal") do |modal|
            modal.title { "Example Modal" }
            p(class: "py-4") { "This is a modal dialog created with DaisyUI On Phlex components." }
            modal.action do
              modal.close_button("Close")
              render DaisyuiOnPhlex::Components::Button.new(variant: :primary) { "Save Changes" }
            end
          end
        end
      end
    end
  end
end

# Generate the example HTML
if __FILE__ == $0
  puts ExampleView.new.call
end
