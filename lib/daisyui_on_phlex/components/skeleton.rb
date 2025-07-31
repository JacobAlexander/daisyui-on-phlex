# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Skeleton < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "skeleton", **@attributes, &block)
      end

      def circle(size: "w-16", **attributes)
        div(class: merge_classes("skeleton", size, "rounded-full"), **attributes)
      end

      def rectangle(width: "w-32", height: "h-4", **attributes)
        div(class: merge_classes("skeleton", width, height), **attributes)
      end
    end
  end
end
