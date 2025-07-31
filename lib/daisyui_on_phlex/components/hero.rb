# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Hero < DaisyuiOnPhlex::Base
      def initialize(overlay: false, **attributes)
        @overlay = overlay
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: merge_classes("hero", "min-h-screen", ("hero-overlay" if @overlay), @attributes[:class]),
          **@attributes.except(:class),
          &block
        )
      end

      def content(**attributes, &block)
        div(class: merge_classes("hero-content", "text-center", attributes[:class]), **attributes.except(:class), &block)
      end

      def overlay(**attributes, &block)
        div(class: merge_classes("hero-overlay", "bg-opacity-60", attributes[:class]), **attributes.except(:class), &block)
      end
    end
  end
end
