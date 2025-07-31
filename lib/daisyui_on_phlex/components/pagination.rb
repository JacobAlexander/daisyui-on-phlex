# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Pagination < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "join", **@attributes, &block)
      end

      def button(text, active: false, disabled: false, **attributes, &block)
        button_tag(
          class: pagination_button_classes(active: active, disabled: disabled),
          disabled: disabled,
          **attributes
        ) do
          if block_given?
            yield
          else
            text
          end
        end
      end

      def link(href:, text, active: false, **attributes, &block)
        a(
          href: href,
          class: pagination_button_classes(active: active),
          **attributes
        ) do
          if block_given?
            yield
          else
            text
          end
        end
      end

      private

      def pagination_button_classes(active: false, disabled: false)
        classes = ["join-item", "btn"]
        classes << "btn-active" if active
        classes << "btn-disabled" if disabled
        merge_classes(*classes)
      end

      def button_tag(...)
        button(...)
      end
    end
  end
end
