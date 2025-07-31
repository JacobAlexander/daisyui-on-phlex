# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Footer < DaisyuiOnPhlex::Base
      def initialize(center: false, **attributes)
        @center = center
        @attributes = attributes
      end

      def view_template(&block)
        footer(class: footer_classes, **@attributes, &block)
      end

      def title(**attributes, &block)
        h6(class: merge_classes("footer-title", attributes[:class]), **attributes.except(:class), &block)
      end

      def link(href:, **attributes, &block)
        a(href: href, class: merge_classes("link", "link-hover", attributes[:class]), **attributes.except(:class), &block)
      end

      private

      def footer_classes
        classes = ["footer", "p-10", "bg-neutral", "text-neutral-content"]
        classes << "items-center" if @center
        merge_classes(*classes)
      end
    end
  end
end
