# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Collapse < DaisyuiOnPhlex::Base
      def initialize(open: false, arrow: false, plus: false, **attributes)
        @open = open
        @arrow = arrow
        @plus = plus
        @attributes = attributes
      end

      def view_template(&block)
        details(
          class: merge_classes(
            "collapse",
            ("collapse-arrow" if @arrow),
            ("collapse-plus" if @plus),
            ("collapse-open" if @open),
            @attributes[:class]
          ),
          open: @open,
          **@attributes.except(:class),
          &block
        )
      end

      def title(**attributes, &block)
        summary(class: merge_classes("collapse-title", attributes[:class]), **attributes.except(:class), &block)
      end

      def content(**attributes, &block)
        div(class: merge_classes("collapse-content", attributes[:class]), **attributes.except(:class), &block)
      end
    end
  end
end
