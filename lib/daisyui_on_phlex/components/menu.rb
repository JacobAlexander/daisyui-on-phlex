# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Menu < DaisyuiOnPhlex::Base
      def initialize(
        size: :md,
        horizontal: false,
        vertical: false,
        compact: false,
        **attributes
      )
        @size = size
        @horizontal = horizontal
        @vertical = vertical
        @compact = compact
        @attributes = attributes
      end

      def view_template(&block)
        ul(class: menu_classes, **@attributes, &block)
      end

      def item(disabled: false, **attributes, &block)
        li(class: ("disabled" if disabled), **attributes, &block)
      end

      def title(**attributes, &block)
        li(class: merge_classes("menu-title", attributes[:class]), **attributes.except(:class), &block)
      end

      def link(href: nil, active: false, **attributes, &block)
        if href
          a(href: href, class: ("active" if active), **attributes, &block)
        else
          span(class: ("active" if active), **attributes, &block)
        end
      end

      private

      def menu_classes
        classes = ["menu"]

        case @size
        when :xs then classes << "menu-xs"
        when :sm then classes << "menu-sm"
        when :md then classes << "menu-md"
        when :lg then classes << "menu-lg"
        end

        classes << "menu-horizontal" if @horizontal
        classes << "menu-vertical" if @vertical
        classes << "menu-compact" if @compact

        merge_classes(*classes)
      end
    end
  end
end
