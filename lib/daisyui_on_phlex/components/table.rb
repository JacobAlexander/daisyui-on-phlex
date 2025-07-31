# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Table < DaisyuiOnPhlex::Base
      def initialize(
        compact: false,
        zebra: false,
        pin_rows: false,
        pin_cols: false,
        **attributes
      )
        @compact = compact
        @zebra = zebra
        @pin_rows = pin_rows
        @pin_cols = pin_cols
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "overflow-x-auto") do
          table(class: table_classes, **@attributes, &block)
        end
      end

      # Helper methods that add actual value by handling DaisyUI-specific styling
      def row(active: false, hover: false, **attributes, &block)
        tr(class: merge_classes(row_classes(active: active, hover: hover), attributes[:class]), **attributes.except(:class), &block)
      end

      private

      def table_classes
        classes = ["table"]
        
        classes << "table-compact" if @compact
        classes << "table-zebra" if @zebra
        classes << "table-pin-rows" if @pin_rows
        classes << "table-pin-cols" if @pin_cols

        merge_classes(*classes)
      end

      def row_classes(active: false, hover: false)
        classes = []
        classes << "active" if active
        classes << "hover" if hover
        merge_classes(*classes)
      end
    end
  end
end
