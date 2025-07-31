# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Calendar < DaisyuiOnPhlex::Base
      def initialize(compact: false, **attributes)
        @compact = compact
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: merge_classes("calendar", ("calendar-compact" if @compact), @attributes[:class]),
          **@attributes.except(:class),
          &block
        )
      end
    end
  end
end
