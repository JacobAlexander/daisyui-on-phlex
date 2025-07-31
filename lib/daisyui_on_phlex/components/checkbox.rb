# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Checkbox < DaisyuiOnPhlex::Base
      def initialize(
        variant: nil,
        size: :md,
        checked: false,
        disabled: false,
        name: nil,
        value: nil,
        **attributes
      )
        @variant = variant
        @size = size
        @checked = checked
        @disabled = disabled
        @name = name
        @value = value
        @attributes = attributes
      end

      def view_template
        input(
          type: "checkbox",
          class: checkbox_classes,
          checked: @checked,
          disabled: @disabled,
          name: @name,
          value: @value,
          **@attributes
        )
      end

      private

      def checkbox_classes
        classes = ["checkbox"]

        # Variant classes
        case @variant
        when :primary then classes << "checkbox-primary"
        when :secondary then classes << "checkbox-secondary"
        when :accent then classes << "checkbox-accent"
        when :success then classes << "checkbox-success"
        when :warning then classes << "checkbox-warning"
        when :info then classes << "checkbox-info"
        when :error then classes << "checkbox-error"
        end

        # Size classes
        case @size
        when :xs then classes << "checkbox-xs"
        when :sm then classes << "checkbox-sm"
        when :md then classes << "checkbox-md"
        when :lg then classes << "checkbox-lg"
        end

        merge_classes(*classes)
      end
    end
  end
end
