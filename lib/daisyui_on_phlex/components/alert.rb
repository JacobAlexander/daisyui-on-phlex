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
        div(class: merge_classes("alert", variant_class), **@attributes) do
          yield if block_given?
        end
      end

      private

      def variant_class
        case @variant
        when :info then "alert-info"
        when :success then "alert-success"
        when :warning then "alert-warning"
        when :error then "alert-error"
        else ""
        end
      end

      def render_icon
        case @variant
        when :info, :success, :warning, :error
          render_svg_icon
        end
      end

      def render_svg_icon
        svg(
          xmlns: "http://www.w3.org/2000/svg",
          class: "stroke-current shrink-0 h-6 w-6",
          fill: "none",
          viewBox: "0 0 24 24"
        ) do
          render_svg_path
        end
      end

      def render_svg_path
        case @variant
        when :info
          tag(:path,
            "stroke-linecap": "round",
            "stroke-linejoin": "round",
            "stroke-width": "2",
            d: "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
          )
        when :success
          tag(:path,
            "stroke-linecap": "round",
            "stroke-linejoin": "round",
            "stroke-width": "2",
            d: "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
          )
        when :warning
          tag(:path,
            "stroke-linecap": "round",
            "stroke-linejoin": "round",
            "stroke-width": "2",
            d: "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"
          )
        when :error
          tag(:path,
            "stroke-linecap": "round",
            "stroke-linejoin": "round",
            "stroke-width": "2",
            d: "M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
          )
        end
      end
    end
  end
end
