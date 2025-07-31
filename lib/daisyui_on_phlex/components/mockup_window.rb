# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    module Mockup
      class Window < DaisyuiOnPhlex::Base
        def initialize(**attributes)
          @attributes = attributes
        end

        def view_template(&block)
          div(class: "mockup-window border bg-base-300", **@attributes, &block)
        end

        def toolbar(**attributes)
          div(class: "flex justify-start px-4 py-2", **attributes) do
            div(class: "btn btn-xs btn-circle btn-ghost")
            div(class: "btn btn-xs btn-circle btn-ghost")
            div(class: "btn btn-xs btn-circle btn-ghost")
          end
        end

        def content(**attributes, &block)
          div(class: merge_classes("flex", "justify-center", "px-4", "py-16", "bg-base-200", attributes[:class]), **attributes.except(:class), &block)
        end
      end
    end
  end
end
