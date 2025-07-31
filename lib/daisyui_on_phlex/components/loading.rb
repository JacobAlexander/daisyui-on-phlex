# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Loading < DaisyuiOnPhlex::Base
      def initialize(variant: :spinner, size: :md, **attributes)
        @variant = variant
        @size = size
        @attributes = attributes
      end

      def view_template
        variant_class = case @variant
        when :spinner then "loading-spinner"
        when :dots then "loading-dots"
        when :ring then "loading-ring"
        when :ball then "loading-ball"
        when :bars then "loading-bars"
        when :infinity then "loading-infinity"
        end

        size_class = case @size
        when :xs then "loading-xs"
        when :sm then "loading-sm"
        when :md then "loading-md"
        when :lg then "loading-lg"
        end

        span(
          class: merge_classes("loading", variant_class, size_class, @attributes[:class]),
          **@attributes.except(:class)
        )
      end
    end
  end
end
