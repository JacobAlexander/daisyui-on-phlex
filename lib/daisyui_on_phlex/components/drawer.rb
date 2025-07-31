# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Drawer < DaisyuiOnPhlex::Base
      def initialize(end: false, **attributes)
        @end = end
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "drawer", **@attributes, &block)
      end

      def toggle(id:, **attributes)
        input(
          id: id,
          type: "checkbox",
          class: "drawer-toggle",
          **attributes
        )
      end

      def content(**attributes, &block)
        div(class: "drawer-content", **attributes, &block)
      end

      def side(**attributes, &block)
        div(class: drawer_side_classes, **attributes, &block)
      end

      def overlay(for_id:, **attributes)
        label(
          for: for_id,
          class: "drawer-overlay",
          **attributes
        )
      end

      private

      def drawer_side_classes
        classes = ["drawer-side"]
        classes << "drawer-end" if @end
        merge_classes(*classes)
      end
    end
  end
end
