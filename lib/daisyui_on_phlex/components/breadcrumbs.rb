# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Breadcrumbs < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "text-sm breadcrumbs", **@attributes) do
          ul(&block)
        end
      end

      def item(href: nil, active: false, **attributes, &block)
        li(**attributes) do
          if href && !active
            a(href: href, &block)
          else
            span(class: ("font-bold" if active), &block)
          end
        end
      end
    end
  end
end
