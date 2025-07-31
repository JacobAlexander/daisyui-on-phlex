# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Status < DaisyuiOnPhlex::Base
      def initialize(
        variant: :online,
        **attributes
      )
        @variant = variant
        @attributes = attributes
      end

      def view_template
        span(class: status_classes, **@attributes)
      end

      private

      def status_classes
        classes = ["badge", "badge-xs"]

        case @variant
        when :online then classes << "badge-success"
        when :offline then classes << "badge-error"
        when :busy then classes << "badge-warning"
        when :away then classes << "badge-accent"
        end

        merge_classes(*classes)
      end
    end
  end
end
