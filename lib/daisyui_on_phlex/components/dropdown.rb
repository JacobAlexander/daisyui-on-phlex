# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Dropdown < DaisyuiOnPhlex::Base
      def initialize(
        position: :bottom,
        align: :start,
        hover: false,
        force_open: false,
        **attributes
      )
        @position = position
        @align = align
        @hover = hover
        @force_open = force_open
        @attributes = attributes
      end

      def view_template(&block)
        div(class: dropdown_classes, **@attributes, &block)
      end

      def trigger(**attributes, &block)
        div(tabindex: "0", role: "button", **attributes, &block)
      end

      def content(**attributes, &block)
        div(
          tabindex: "0",
          class: dropdown_content_classes,
          **attributes,
          &block
        )
      end

      private

      def dropdown_classes
        classes = ["dropdown"]
        
        case @position
        when :top then classes << "dropdown-top"
        when :bottom then classes << "dropdown-bottom"
        when :left then classes << "dropdown-left"
        when :right then classes << "dropdown-right"
        end

        case @align
        when :end then classes << "dropdown-end"
        end

        classes << "dropdown-hover" if @hover
        classes << "dropdown-open" if @force_open

        merge_classes(*classes)
      end

      def dropdown_content_classes
        classes = ["dropdown-content", "z-[1]", "menu", "p-2", "shadow", "bg-base-100", "rounded-box", "w-52"]
        merge_classes(*classes)
      end
    end
  end
end
