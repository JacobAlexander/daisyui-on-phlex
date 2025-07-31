# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Rating < DaisyuiOnPhlex::Base
      def initialize(
        size: :md,
        half: false,
        **attributes
      )
        @size = size
        @half = half
        @attributes = attributes
      end

      def view_template(&block)
        div(class: rating_classes, **@attributes, &block)
      end

      def star(
        name:,
        value:,
        checked: false,
        hidden: false,
        **attributes
      )
        input(
          type: "radio",
          name: name,
          value: value,
          class: star_classes(hidden: hidden),
          checked: checked,
          **attributes
        )
      end

      private

      def rating_classes
        classes = ["rating"]
        classes << "rating-half" if @half

        case @size
        when :xs then classes << "rating-xs"
        when :sm then classes << "rating-sm"
        when :md then classes << "rating-md"
        when :lg then classes << "rating-lg"
        end

        merge_classes(*classes)
      end

      def star_classes(hidden: false)
        classes = []
        classes << "rating-hidden" if hidden
        classes << "mask mask-star-2 bg-orange-400"
        merge_classes(*classes)
      end
    end
  end
end
