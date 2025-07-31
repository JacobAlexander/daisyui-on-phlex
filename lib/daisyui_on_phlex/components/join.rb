# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Join < DaisyuiOnPhlex::Base
      def initialize(vertical: false, **attributes)
        @vertical = vertical
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: merge_classes("join", ("join-vertical" if @vertical), @attributes[:class]),
          **@attributes.except(:class),
          &block
        )
      end

      def item(**attributes, &block)
        div(class: merge_classes("join-item", attributes[:class]), **attributes.except(:class), &block)
      end
    end
  end
end
