# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Label < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "label", **@attributes, &block)
      end

      def text(**attributes, &block)
        span(class: "label-text", **attributes, &block)
      end

      def alt_text(**attributes, &block)
        span(class: "label-text-alt", **attributes, &block)
      end
    end
  end
end
