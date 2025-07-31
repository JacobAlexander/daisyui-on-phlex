# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Input < DaisyuiOnPhlex::Base
      def initialize(
        type: :text,
        size: :md,
        variant: nil,
        bordered: true,
        ghost: false,
        **attributes
      )
        @type = type
        @size = size
        @variant = variant
        @bordered = bordered
        @ghost = ghost
        @attributes = attributes
      end

      def view_template
        input(
          type: @type,
          class: input_classes,
          **@attributes
        )
      end

      private

      def input_classes
        classes = ["input"]
        
        # Base styling
        classes << "input-bordered" if @bordered
        classes << "input-ghost" if @ghost

        # Size classes
        case @size
        when :xs then classes << "input-xs"
        when :sm then classes << "input-sm"
        when :md then # default, no class needed
        when :lg then classes << "input-lg"
        end

        # Variant classes
        case @variant
        when :primary then classes << "input-primary"
        when :secondary then classes << "input-secondary"
        when :accent then classes << "input-accent"
        when :info then classes << "input-info"
        when :success then classes << "input-success"
        when :warning then classes << "input-warning"
        when :error then classes << "input-error"
        end

        merge_classes(*classes)
      end
    end
  end
end
