# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class FileInput < DaisyuiOnPhlex::Base
      def initialize(
        variant: nil,
        size: :md,
        bordered: false,
        ghost: false,
        name: nil,
        multiple: false,
        accept: nil,
        **attributes
      )
        @variant = variant
        @size = size
        @bordered = bordered
        @ghost = ghost
        @name = name
        @multiple = multiple
        @accept = accept
        @attributes = attributes
      end

      def view_template
        input(
          type: "file",
          class: file_input_classes,
          name: @name,
          multiple: @multiple,
          accept: @accept,
          **@attributes
        )
      end

      private

      def file_input_classes
        classes = ["file-input"]

        # Variant classes
        case @variant
        when :primary then classes << "file-input-primary"
        when :secondary then classes << "file-input-secondary"
        when :accent then classes << "file-input-accent"
        when :info then classes << "file-input-info"
        when :success then classes << "file-input-success"
        when :warning then classes << "file-input-warning"
        when :error then classes << "file-input-error"
        end

        # Size classes
        case @size
        when :xs then classes << "file-input-xs"
        when :sm then classes << "file-input-sm"
        when :md then classes << "file-input-md"
        when :lg then classes << "file-input-lg"
        end

        # Style modifiers
        classes << "file-input-bordered" if @bordered
        classes << "file-input-ghost" if @ghost

        merge_classes(*classes)
      end
    end
  end
end
