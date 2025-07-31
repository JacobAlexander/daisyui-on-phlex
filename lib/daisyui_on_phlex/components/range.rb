# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Range < DaisyuiOnPhlex::Base
      def initialize(
        min: 0,
        max: 100,
        value: 50,
        step: 1,
        variant: nil,
        size: :md,
        **attributes
      )
        @min = min
        @max = max
        @value = value
        @step = step
        @variant = variant
        @size = size
        @attributes = attributes
      end

      def view_template
        input(
          type: "range",
          class: range_classes,
          min: @min,
          max: @max,
          value: @value,
          step: @step,
          **@attributes
        )
      end

      private

      def range_classes
        classes = ["range"]

        case @variant
        when :primary then classes << "range-primary"
        when :secondary then classes << "range-secondary"
        when :accent then classes << "range-accent"
        when :success then classes << "range-success"
        when :warning then classes << "range-warning"  
        when :info then classes << "range-info"
        when :error then classes << "range-error"
        end

        case @size
        when :xs then classes << "range-xs"
        when :sm then classes << "range-sm"
        when :md then classes << "range-md"
        when :lg then classes << "range-lg"
        end

        merge_classes(*classes)
      end
    end
  end
end
