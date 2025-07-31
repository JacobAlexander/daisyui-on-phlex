# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Divider < DaisyuiOnPhlex::Base
      def initialize(vertical: false, **attributes)
        @vertical = vertical
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: merge_classes("divider", ("divider-horizontal" if @vertical), @attributes[:class]),
          **@attributes.except(:class),
          &block
        )
      end
    end
  end
end
