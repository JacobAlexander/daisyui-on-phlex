# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class RadialProgress < DaisyuiOnPhlex::Base
      def initialize(
        value: 0,
        size: "4rem",
        thickness: "2px",
        variant: nil,
        **attributes
      )
        @value = value
        @size = size
        @thickness = thickness
        @variant = variant
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: radial_progress_classes,
          style: radial_progress_styles,
          **@attributes,
          &block
        )
      end

      private

      def radial_progress_classes
        classes = ["radial-progress"]

        case @variant
        when :primary then classes << "text-primary"
        when :secondary then classes << "text-secondary"
        when :accent then classes << "text-accent"
        when :info then classes << "text-info"
        when :success then classes << "text-success"
        when :warning then classes << "text-warning"
        when :error then classes << "text-error"
        end

        merge_classes(*classes)
      end

      def radial_progress_styles
        styles = []
        styles << "--value: #{@value}"
        styles << "--size: #{@size}"
        styles << "--thickness: #{@thickness}"
        styles.join("; ")
      end
    end
  end
end
