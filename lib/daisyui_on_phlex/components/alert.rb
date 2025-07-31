# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Alert < DaisyuiOnPhlex::Base
      def initialize(
        variant: :info,
        **attributes
      )
        @variant = variant
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: alert_classes,
          **@attributes
        ) do
          render_icon if icon_for_variant
          div(&block) if block_given?
        end
      end

      private

      def alert_classes
        classes = ["alert"]
        
        case @variant
        when :info then classes << "alert-info"
        when :success then classes << "alert-success"
        when :warning then classes << "alert-warning"
        when :error then classes << "alert-error"
        end

        merge_classes(*classes)
      end

      def icon_for_variant
        case @variant
        when :info then "info"
        when :success then "check"
        when :warning then "warning"
        when :error then "error"
        end
      end

      def render_icon
        render_svg_icon
      end

      def render_svg_icon
        svg(
          xmlns: "http://www.w3.org/2000/svg",
          class: "h-6 w-6 shrink-0 stroke-current",
          fill: "none",
          viewBox: "0 0 24 24"
        ) do
          render_svg_path
        end
      end

      def render_svg_path
        case @variant
        when :info
          unsafe_raw '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>'
        when :success
          unsafe_raw '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>'
        when :warning
          unsafe_raw '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"></path>'
        when :error
          unsafe_raw '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>'
        end
      end
    end
  end
end
