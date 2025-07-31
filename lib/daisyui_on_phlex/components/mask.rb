# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Mask < DaisyuiOnPhlex::Base
      def initialize(variant: :squircle, **attributes)
        @variant = variant
        @attributes = attributes
      end

      def view_template(&block)
        variant_classes = {
          squircle: "mask-squircle",
          heart: "mask-heart",
          hexagon: "mask-hexagon",
          hexagon_2: "mask-hexagon-2",
          decagon: "mask-decagon",
          pentagon: "mask-pentagon",
          diamond: "mask-diamond",
          square: "mask-square",
          circle: "mask-circle",
          parallelogram: "mask-parallelogram",
          parallelogram_2: "mask-parallelogram-2",
          parallelogram_3: "mask-parallelogram-3",
          parallelogram_4: "mask-parallelogram-4",
          star: "mask-star",
          star_2: "mask-star-2",
          triangle: "mask-triangle",
          triangle_2: "mask-triangle-2",
          triangle_3: "mask-triangle-3",
          triangle_4: "mask-triangle-4"
        }

        div(
          class: merge_classes("mask", variant_classes[@variant], @attributes[:class]),
          **@attributes.except(:class),
          &block
        )
      end
    end
  end
end
