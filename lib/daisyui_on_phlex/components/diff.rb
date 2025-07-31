# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Diff < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "diff aspect-[16/9]", **@attributes, &block)
      end

      def item_1(**attributes, &block)
        div(class: "diff-item-1", **attributes, &block)
      end

      def item_2(**attributes, &block)
        div(class: "diff-item-2", **attributes, &block)
      end

      def resizer
        div(class: "diff-resizer")
      end
    end
  end
end
