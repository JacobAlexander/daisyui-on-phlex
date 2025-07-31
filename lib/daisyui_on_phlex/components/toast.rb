# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Toast < DaisyuiOnPhlex::Base
      def initialize(
        position: :top_end,
        **attributes
      )
        @position = position
        @attributes = attributes
      end

      def view_template(&block)
        div(class: toast_classes, **@attributes, &block)
      end

      def alert(variant: :info, **attributes, &block)
        div(class: alert_classes(variant), **attributes, &block)
      end

      private

      def toast_classes
        classes = ["toast"]

        case @position
        when :top_start then classes << "toast-top" << "toast-start"
        when :top_center then classes << "toast-top" << "toast-center"
        when :top_end then classes << "toast-top" << "toast-end"
        when :middle_start then classes << "toast-middle" << "toast-start"
        when :middle_center then classes << "toast-middle" << "toast-center"
        when :middle_end then classes << "toast-middle" << "toast-end"
        when :bottom_start then classes << "toast-bottom" << "toast-start"
        when :bottom_center then classes << "toast-bottom" << "toast-center"
        when :bottom_end then classes << "toast-bottom" << "toast-end"
        end

        merge_classes(*classes)
      end

      def alert_classes(variant)
        classes = ["alert"]

        case variant
        when :info then classes << "alert-info"
        when :success then classes << "alert-success"
        when :warning then classes << "alert-warning"
        when :error then classes << "alert-error"
        end

        merge_classes(*classes)
      end
    end
  end
end
