# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Dock < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "btm-nav", **@attributes, &block)
      end

      def item(active: false, disabled: false, **attributes, &block)
        button(
          class: dock_item_classes(active: active, disabled: disabled),
          disabled: disabled,
          **attributes,
          &block
        )
      end

      private

      def dock_item_classes(active:, disabled:)
        classes = []
        classes << "active" if active
        classes << "disabled" if disabled
        merge_classes(*classes)
      end
    end
  end
end
