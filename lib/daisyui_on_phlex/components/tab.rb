# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Tab < DaisyuiOnPhlex::Base
      def initialize(
        size: :md,
        variant: :bordered,
        **attributes
      )
        @size = size
        @variant = variant
        @attributes = attributes
      end

      def view_template(&block)
        div(class: tabs_classes, **@attributes, &block)
      end

      def tab(
        active: false,
        disabled: false,
        **attributes,
        &block
      )
        a(class: tab_classes(active: active, disabled: disabled), **attributes, &block)
      end

      def content(active: false, **attributes, &block)
        div(
          class: tab_content_classes(active: active),
          **attributes,
          &block
        )
      end

      private

      def tabs_classes
        classes = ["tabs"]

        case @variant
        when :bordered then classes << "tabs-bordered"
        when :lifted then classes << "tabs-lifted"
        when :boxed then classes << "tabs-boxed"
        end

        case @size
        when :xs then classes << "tabs-xs"
        when :sm then classes << "tabs-sm"
        when :md then classes << "tabs-md"
        when :lg then classes << "tabs-lg"
        end

        merge_classes(*classes)
      end

      def tab_classes(active: false, disabled: false)
        classes = ["tab"]
        classes << "tab-active" if active
        classes << "tab-disabled" if disabled
        merge_classes(*classes)
      end

      def tab_content_classes(active: false)
        classes = ["tab-content"]
        classes << "tab-content-active" if active
        merge_classes(*classes)
      end
    end
  end
end
