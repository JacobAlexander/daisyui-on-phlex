# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Tooltip < DaisyuiOnPhlex::Base
      def initialize(
        text:,
        position: :top,
        variant: nil,
        force_open: false,
        **attributes
      )
        @text = text
        @position = position
        @variant = variant
        @force_open = force_open
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: tooltip_classes,
          "data-tip": @text,
          **@attributes,
          &block
        )
      end

      private

      def tooltip_classes
        classes = ["tooltip"]

        case @position
        when :top then classes << "tooltip-top"
        when :bottom then classes << "tooltip-bottom"
        when :left then classes << "tooltip-left"
        when :right then classes << "tooltip-right"
        end

        case @variant
        when :primary then classes << "tooltip-primary"
        when :secondary then classes << "tooltip-secondary"
        when :accent then classes << "tooltip-accent"
        when :info then classes << "tooltip-info"
        when :success then classes << "tooltip-success"
        when :warning then classes << "tooltip-warning"
        when :error then classes << "tooltip-error"
        end

        classes << "tooltip-open" if @force_open

        merge_classes(*classes)
      end
    end
  end
end
