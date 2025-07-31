# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Progress < DaisyuiOnPhlex::Base
      def initialize(
        value: 0,
        max: 100,
        variant: nil,
        **attributes
      )
        @value = value
        @max = max
        @variant = variant
        @attributes = attributes
      end

      def view_template
        progress_tag(
          class: progress_classes,
          value: @value,
          max: @max,
          **@attributes
        )
      end

      private

      def progress_classes
        classes = ["progress", "w-56"]

        case @variant
        when :primary then classes << "progress-primary"
        when :secondary then classes << "progress-secondary"
        when :accent then classes << "progress-accent"
        when :info then classes << "progress-info"
        when :success then classes << "progress-success"
        when :warning then classes << "progress-warning"
        when :error then classes << "progress-error"
        end

        merge_classes(*classes)
      end

      def progress_tag(...)
        progress(...)
      end
    end
  end
end
