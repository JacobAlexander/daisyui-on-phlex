# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Select < DaisyuiOnPhlex::Base
      def initialize(
        variant: nil,
        size: :md,
        bordered: false,
        ghost: false,
        name: nil,
        **attributes
      )
        @variant = variant
        @size = size
        @bordered = bordered
        @ghost = ghost
        @name = name
        @attributes = attributes
      end

      def view_template(&block)
        select(
          class: select_classes,
          name: @name,
          **@attributes,
          &block
        )
      end

      def option(value:, selected: false, disabled: false, **attributes, &block)
        option_tag(
          value: value,
          selected: selected,
          disabled: disabled,
          **attributes,
          &block
        )
      end

      private

      def select_classes
        classes = ["select", "w-full", "max-w-xs"]

        case @variant
        when :primary then classes << "select-primary"
        when :secondary then classes << "select-secondary"
        when :accent then classes << "select-accent"
        when :info then classes << "select-info"
        when :success then classes << "select-success"
        when :warning then classes << "select-warning"
        when :error then classes << "select-error"
        end

        case @size
        when :xs then classes << "select-xs"
        when :sm then classes << "select-sm"
        when :md then classes << "select-md"
        when :lg then classes << "select-lg"
        end

        classes << "select-bordered" if @bordered
        classes << "select-ghost" if @ghost

        merge_classes(*classes)
      end

      def option_tag(...)
        option(...)
      end
    end
  end
end
