# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Navbar < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "navbar bg-base-100", **@attributes, &block)
      end

      def start(**attributes, &block)
        div(class: merge_classes("navbar-start", attributes[:class]), **attributes.except(:class), &block)
      end

      def center(**attributes, &block)
        div(class: merge_classes("navbar-center", attributes[:class]), **attributes.except(:class), &block)
      end

      def end(**attributes, &block)
        div(class: merge_classes("navbar-end", attributes[:class]), **attributes.except(:class), &block)
      end
    end
  end
end
