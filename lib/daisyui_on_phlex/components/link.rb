# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Link < DaisyuiOnPhlex::Base
      def initialize(
        variant: nil,
        hover: false,
        neutral: false,
        **attributes
      )
        @variant = variant
        @hover = hover
        @neutral = neutral
        @attributes = attributes
      end

      def view_template(&block)
        a(class: link_classes, **@attributes, &block)
      end

      private

      def link_classes
        classes = ["link"]

        case @variant
        when :primary then classes << "link-primary"
        when :secondary then classes << "link-secondary"
        when :accent then classes << "link-accent"
        when :neutral then classes << "link-neutral"
        when :info then classes << "link-info"
        when :success then classes << "link-success"
        when :warning then classes << "link-warning"
        when :error then classes << "link-error"
        end

        classes << "link-hover" if @hover
        classes << "link-neutral" if @neutral

        merge_classes(*classes)
      end
    end
  end
end
