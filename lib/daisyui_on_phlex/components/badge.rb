# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Badge < DaisyuiOnPhlex::Base
      def initialize(
        variant: :neutral,
        size: :md,
        outline: false,
        **attributes
      )
        @variant = variant
        @size = size
        @outline = outline
        @attributes = attributes
      end

      def view_template(&block)
        span(
          class: badge_classes,
          **@attributes,
          &block
        )
      end

      private

      def badge_classes
        classes = ["badge"]
        
        # Variant classes
        case @variant
        when :primary then classes << "badge-primary"
        when :secondary then classes << "badge-secondary"
        when :accent then classes << "badge-accent"
        when :neutral then classes << "badge-neutral"
        when :info then classes << "badge-info"
        when :success then classes << "badge-success"
        when :warning then classes << "badge-warning"
        when :error then classes << "badge-error"
        when :ghost then classes << "badge-ghost"
        end

        # Size classes
        case @size
        when :xs then classes << "badge-xs"
        when :sm then classes << "badge-sm"
        when :md then # default, no class needed
        when :lg then classes << "badge-lg"
        end

        # Modifier classes
        classes << "badge-outline" if @outline

        merge_classes(*classes)
      end
    end
  end
end
