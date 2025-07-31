# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Card < DaisyuiOnPhlex::Base
      def initialize(
        compact: false,
        bordered: false,
        image_full: false,
        side: false,
        **attributes
      )
        @compact = compact
        @bordered = bordered
        @image_full = image_full
        @side = side
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: card_classes,
          **@attributes,
          &block
        )
      end

      def body(css_class: nil, **attributes, &block)
        div(
          class: merge_classes("card-body", css_class),
          **attributes,
          &block
        )
      end

      def title(css_class: nil, **attributes, &block)
        h2(
          class: merge_classes("card-title", css_class),
          **attributes,
          &block
        )
      end

      def actions(css_class: nil, **attributes, &block)
        div(
          class: merge_classes("card-actions", css_class),
          **attributes,
          &block
        )
      end

      def figure(css_class: nil, **attributes, &block)
        figure_tag(
          class: merge_classes("", css_class),
          **attributes,
          &block
        )
      end

      private

      def figure_tag(...)
        public_send(:figure, ...)
      end

      def card_classes
        classes = ["card"]
        
        classes << "card-compact" if @compact
        classes << "card-bordered" if @bordered
        classes << "image-full" if @image_full
        classes << "card-side" if @side

        merge_classes(*classes)
      end
    end
  end
end
