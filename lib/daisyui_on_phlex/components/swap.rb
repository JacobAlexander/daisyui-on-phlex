# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Swap < DaisyuiOnPhlex::Base
      def initialize(
        active: false,
        rotate: false,
        flip: false,
        **attributes
      )
        @active = active
        @rotate = rotate
        @flip = flip
        @attributes = attributes
      end

      def view_template(&block)
        label(class: swap_classes, **@attributes, &block)
      end

      def checkbox(**attributes)
        input(type: "checkbox", class: "swap-checkbox", **attributes)
      end

      def on(**attributes, &block)
        div(class: "swap-on", **attributes, &block)
      end

      def off(**attributes, &block)
        div(class: "swap-off", **attributes, &block)
      end

      private

      def swap_classes
        classes = ["swap"]
        classes << "swap-active" if @active
        classes << "swap-rotate" if @rotate
        classes << "swap-flip" if @flip
        merge_classes(*classes)
      end
    end
  end
end
