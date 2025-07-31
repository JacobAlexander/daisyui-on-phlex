# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    module Mockup
      class Browser < DaisyuiOnPhlex::Base
        def initialize(**attributes)
          @attributes = attributes
        end

        def view_template(&block)
          div(class: "mockup-browser border bg-base-300", **@attributes, &block)
        end

        def toolbar(**attributes, &block)
          div(class: merge_classes("mockup-browser-toolbar", attributes[:class]), **attributes.except(:class), &block)
        end

        def content(**attributes, &block)
          div(class: merge_classes("flex", "justify-center", "px-4", "py-16", "bg-base-200", attributes[:class]), **attributes.except(:class), &block)
        end
      end
    end
  end
end
