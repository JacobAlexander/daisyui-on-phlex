# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Toggle < DaisyuiOnPhlex::Base
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
          class: toggle_classes,
          checked: @checked,
          disabled: @disabled,
          name: @name,
          value: @value,
          **@attributes
        )
      end

      private

      def toggle_classes
        classes = ["toggle"]

        case @variant
        when :primary then classes << "toggle-primary"
        when :secondary then classes << "toggle-secondary"
        when :accent then classes << "toggle-accent"
        when :success then classes << "toggle-success"
        when :warning then classes << "toggle-warning"
        when :info then classes << "toggle-info"
        when :error then classes << "toggle-error"
        end

        case @size
        when :xs then classes << "toggle-xs"
        when :sm then classes << "toggle-sm"
        when :md then classes << "toggle-md"
        when :lg then classes << "toggle-lg"
        end

        merge_classes(*classes)
      end
    end
  end
end
