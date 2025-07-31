# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Carousel < DaisyuiOnPhlex::Base
      def initialize(center: false, end: false, vertical: false, **attributes)
        @center = center
        @end = end
        @vertical = vertical
        @attributes = attributes
      end

      def view_template(&block)
        div(class: carousel_classes, **@attributes, &block)
      end

      def item(id: nil, **attributes, &block)
        div(
          class: "carousel-item",
          id: id,
          **attributes,
          &block
        )
      end

      private

      def carousel_classes
        classes = ["carousel"]
        classes << "carousel-center" if @center
        classes << "carousel-end" if @end
        classes << "carousel-vertical" if @vertical
        merge_classes(*classes)
      end
    end
  end
end
