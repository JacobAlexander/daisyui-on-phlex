# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Textarea < DaisyuiOnPhlex::Base
      def initialize(
        variant: nil,
        size: :md,
        bordered: false,
        ghost: false,
        placeholder: nil,
        name: nil,
        rows: 4,
        **attributes
      )
        @variant = variant
        @size = size
        @bordered = bordered
        @ghost = ghost
        @placeholder = placeholder
        @name = name
        @rows = rows
        @attributes = attributes
      end

      def view_template(&block)
        textarea(
          class: textarea_classes,
          placeholder: @placeholder,
          name: @name,
          rows: @rows,
          **@attributes,
          &block
        )
      end

      private

      def textarea_classes
        classes = ["textarea", "w-full"]

        case @variant
        when :primary then classes << "textarea-primary"
        when :secondary then classes << "textarea-secondary"
        when :accent then classes << "textarea-accent"
        when :info then classes << "textarea-info"
        when :success then classes << "textarea-success"
        when :warning then classes << "textarea-warning"
        when :error then classes << "textarea-error"
        end

        case @size
        when :xs then classes << "textarea-xs"
        when :sm then classes << "textarea-sm"
        when :md then classes << "textarea-md"
        when :lg then classes << "textarea-lg"
        end

        classes << "textarea-bordered" if @bordered
        classes << "textarea-ghost" if @ghost

        merge_classes(*classes)
      end
    end
  end
end
