# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Radio < DaisyuiOnPhlex::Base
      def initialize(
        variant: nil,
        size: :md,
        name: nil,
        value: nil,
        checked: false,
        disabled: false,
        **attributes
      )
        @variant = variant
        @size = size
        @name = name
        @value = value
        @checked = checked
        @disabled = disabled
        @attributes = attributes
      end

      def view_template
        input(
          type: "radio",
          class: radio_classes,
          name: @name,
          value: @value,
          checked: @checked,
          disabled: @disabled,
          **@attributes
        )
      end

      private

      def radio_classes
        classes = ["radio"]

        case @variant
        when :primary then classes << "radio-primary"
        when :secondary then classes << "radio-secondary"
        when :accent then classes << "radio-accent"
        when :success then classes << "radio-success"
        when :warning then classes << "radio-warning"
        when :info then classes << "radio-info"
        when :error then classes << "radio-error"
        end

        case @size
        when :xs then classes << "radio-xs"
        when :sm then classes << "radio-sm"
        when :md then classes << "radio-md"
        when :lg then classes << "radio-lg"
        end

        merge_classes(*classes)
      end
    end
  end
end
