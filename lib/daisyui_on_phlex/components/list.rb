# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class List < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        ul(class: "menu bg-base-200 w-56 rounded-box", **@attributes, &block)
      end

      def section_title(**attributes, &block)
        li(class: merge_classes("menu-title", attributes[:class]), **attributes.except(:class), &block)
      end
    end
  end
end
