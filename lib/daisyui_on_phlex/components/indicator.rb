# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Indicator < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "indicator", **@attributes, &block)
      end

      def item(
        position: :top_end,
        variant: nil,
        **attributes,
        &block
      )
        span(
          class: indicator_item_classes(position: position, variant: variant),
          **attributes,
          &block
        )
      end

      private

      def indicator_item_classes(position:, variant:)
        classes = ["indicator-item"]

        case position
        when :top_start then classes << "indicator-top" << "indicator-start"
        when :top_center then classes << "indicator-top" << "indicator-center"
        when :top_end then classes << "indicator-top" << "indicator-end"
        when :middle_start then classes << "indicator-middle" << "indicator-start"
        when :middle_center then classes << "indicator-middle" << "indicator-center"
        when :middle_end then classes << "indicator-middle" << "indicator-end"
        when :bottom_start then classes << "indicator-bottom" << "indicator-start"
        when :bottom_center then classes << "indicator-bottom" << "indicator-center"
        when :bottom_end then classes << "indicator-bottom" << "indicator-end"
        end

        case variant
        when :primary then classes << "badge-primary"
        when :secondary then classes << "badge-secondary"
        when :accent then classes << "badge-accent"
        when :neutral then classes << "badge-neutral"
        when :info then classes << "badge-info"
        when :success then classes << "badge-success"
        when :warning then classes << "badge-warning"
        when :error then classes << "badge-error"
        end

        classes << "badge" if variant

        merge_classes(*classes)
      end
    end
  end
end
